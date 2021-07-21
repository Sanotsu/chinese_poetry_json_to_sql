const loadJsonFile = require('load-json-file');
const fs = require('fs');
const { once } = require('events');
const { createReadStream } = require('fs');
const { createInterface } = require('readline');

const pool = require('./MysqlConfig').promisePool;

const initCorpusMap = require('./RelatedMap');

/**
 * Simplification 是把外面的方面在抽出来一下,免得有太多的文件和重复的内容了
 * 
 * 需要注意的时,原库中表示内容的字段,一会儿是content,一会儿是paragraphs,虽然ddl中都以源文件名称为主
 * 但实际使用时,建议统一名称
 */

/**
 * 读取json这个文件夹,或许需要的文件名
 * @param {*} path 文件夹位置
 * @param {*} prefix 需要的前缀
 * @param {*} exclude 需要的前缀中排除某些无意义的
 * @returns 
 */
let handleDirectory = (path, prefix, exclude = '') => {
    try {
        // 遍历指定文件夹的文件
        let files = fs.readdirSync(path);
        // 只要指定开头的文件名
        if (exclude) {
            return files.filter(f => f.startsWith(prefix) && !f.startsWith(exclude));
        } else {
            return files.filter(f => f.startsWith(prefix));
        }
    } catch (err) {
        console.error(err)
    }
}


/**
 * 格式化元曲json文件格式正确
 * @returns 格式化之后的元曲json文件位置
 */
let formatYuanquJson = async (path) => {
    const pathArr = path.split('/');

    let originPath = path;
    let tempPath = pathArr.slice(0, pathArr.length - 1).join('/') + '/yuanqu_temp.json';
    let formatPath = pathArr.slice(0, pathArr.length - 1).join('/') + '/yuanqu_format.json'

    // 首行差个[
    fs.writeFileSync(tempPath, '[');
    try {
        const rl = createInterface({
            input: createReadStream(originPath),
            crlfDelay: Infinity
        });

        rl.on('line', (line) => {
            // 每句都加个逗号
            fs.appendFileSync(tempPath, line + ',')
        });

        await once(rl, 'close');

        // 重新完之后,替换掉多余的逗号  },],-> }]
        var data = fs.readFileSync(tempPath, 'utf-8');
        // 创建新文件
        fs.writeFileSync(formatPath, data.replace('},],', '}]'));
        // 删除临时文件
        fs.unlinkSync(tempPath);
        // console.log('文件已处理', formatPath);
        return formatPath;
    } catch (err) {
        console.error(err);
    }
}

/**
 * 构建insert的sql语句
 * @param {*} poetryJson 诗集的json数据
 * @param {*} fieldInfo 数据库库\栏位名等信息,是个对象
 * @param {*} isValueBreak 是否生成的sql每个value都独立一行,方便查看
 * @param {*} isKeepLineFeed 是否保留生成sql中正文包含换行符(如果为false的话,其结果写到文件只有一行数据)
 * @returns 
 */
let buildSQLStatement = (poetryJson, fieldInfo, isValueBreak = true, isKeepLineFeed = false) => {

    /**
     * 分别说明参数意义
     * tableName 数据库的表名
     * fieldArr 要直接插入表的栏位数组
     * jsonFieldArr 要插入的栏位对应json文件中的直接保存的栏位,注意一定要一一对应
     * jsonArrayArr 要插入的栏位对应json文件中的数组格式的栏位,需要把数组内容拼接到一起
     *      注意栏位值关系 fieldArr <=> jsonFieldArr + jsonArrayArr,且顺序也要一致,否则插入内容和栏位就对不上了
     *      类似 [1,2,3,4,5] <=> [1,2,3]+[4,5]

     */
    let { tableName, fieldArr, jsonFieldArr, jsonArrayArr } = fieldInfo;

    // 0 简单检查以上字段是否符合规范(略)

    // 1 拼接sql语句前半句
    let fields = '';
    for (let i = 0; i < fieldArr.length; i++) {
        const e = fieldArr[i];
        (i === fieldArr.length - 1) ? fields += e : fields += (e + ',');
    }

    let insertSql = `INSERT INTO chinese_poetry.${tableName}(${fields}) VALUES `;


    // 拼接insert的value
    for (let i = 0; i < poetryJson.length; i++) {
        let singlePoem = poetryJson[i];
        let value = '';


        // 临时保存被格式化的数组属性
        let tempFormatData = []
        for (let i = 0; i < jsonArrayArr.length; i++) {
            const e = jsonArrayArr[i];

            let tempContent = singlePoem[e] ? singlePoem[e] : [];

            // 【注意】有些诗歌数组正文的一句末尾是没有标点符号的，不换行存入db，则需要加个空格连接,以示区分。
            let content = isKeepLineFeed ? tempContent.join("\n") : tempContent.join(' ');

            tempFormatData.push(content);
        }

        jsonFileds = jsonFieldArr.concat(tempFormatData);

        // 构建每一条value值
        let temp = '(';
        for (let i = 0; i < jsonFileds.length; i++) {
            const e = jsonFileds[i];

            // 先拼接直接存入的栏位
            if (i < jsonFieldArr.length) {
                if (jsonArrayArr.length <= 0) {
                    (i === jsonFieldArr.length - 1) ? temp += `'${singlePoem[e]}'` : temp += `'${singlePoem[e]}',`;
                } else {
                    temp += `'${singlePoem[e]}',`
                }
            }

            // 再拼接被格式化的json属性(如果jsonArrayArr为空,就进不了这个if了,例如 5-1 < i < 5)
            if (i > jsonFieldArr.length - 1 && i < jsonFileds.length) {
                (i === jsonFileds.length - 1) ? temp += `'${e}'` : temp += `'${e}',`;
            }
        }

        temp += ')';

        // 正常的value以逗号分割,最后一个value以分号结尾
        if (i === poetryJson.length - 1) {
            value = isValueBreak ? `\n${temp};\n` : `${temp};\n`;
        } else {
            // sql语句中每个value是否换行
            value = isValueBreak ? `\n${temp},` : `${temp},`;
        }
        insertSql += value;
    }

    return insertSql;
}

/**
 * 将insertsql语句写入文件,并根据需求将数据插入数据库
 * @param {*} corpusName 要处理的文集名称(内容必须与initCorpusMap中一致,否则就找不到)
 * @param {*} sqlName 生成的insert语句的sql文件的名称,如果不输入,则默认
 */
async function genFileAndInsertToTable(corpusName, sqlName = 'init', isInsertToDb = false) {

    let data = initCorpusMap.get(corpusName);

    if (data.isYuanOpera) {
        data.jsonPath = await formatYuanquJson(data.jsonPath);
    }

    try {
        //  如果是文件夹,遍历操作
        if (data.isDir) {
            // 读取指定文件夹json
            let files = handleDirectory(data.jsonPath, data.prefix, data.exclude);
            // 因为有多个文件,遍历操作
            for (let i = 0; i < files.length; i++) {
                const e = files[i];

                // 1 拼接sql语句
                let insertSql = buildSQLStatement(loadJsonFile.sync(data.jsonPath + "/" + e), data);

                // 2 保存sql语句到文件
                fs.appendFileSync(`./${sqlName}.sql`, insertSql)

                // 3 执行新增数据到DB表操作
                // 可以使用 show variables like '%max_allowed_packet%'; 查看数据库设定
                // 本例中一条insert插入个几千几万个数据是没有问题的,所以就单个文件一句insert,没有再拆分
                if (isInsertToDb) {
                    await pool.query(insertSql);
                }
            }
        } else {
            // 1 拼接sql语句
            let insertSql = buildSQLStatement(loadJsonFile.sync(data.jsonPath), data);

            // 2 保存sql语句到文件
            fs.appendFileSync(`./${sqlName}.sql`, insertSql)

            // 3 执行新增数据到DB表操作
            if (isInsertToDb) {
                await pool.query(insertSql);
            }
        }
    } catch (error) {
        console.log(error)
    }
}


module.exports = {
    genFileAndInsertToTable
}

