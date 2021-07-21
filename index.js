const moment = require('moment');
const genSqlFile = require('./utils/genSql').genFileAndInsertToTable;

/**
 *  目前支持转换为sql文件的文集,含义分别为:
 *      文集代号 文集中文名称 chinese-poetry-master源码中相对位置
 * 
 * 一定注意名称和文件地址等对应关系正确,有变化需要在RelatedMap.js文件中处理好
 * 
 */

let canGenArr = [
    'the_book_of_songs',    // 诗经             shijing/shijing.json
    'songs_of_chu',         // 楚辞             chuci/chuci.json
    'caocao_poetry',        // 曹操诗集          caocaoshiji/caocao.json
    'tang_poetry',          // 唐诗             json/poet.tang.*.json
    'hua_jian_ji',          // 花间集           wudai/huajianji/huajianji-*.json(除perface)
    'nan_tang_er_zhu_ci',   // 南唐二主词        wudai/nantang/poetrys.json
    'song_ci',              // 宋词             ci/ci.song.*.json
    'song_poetry',          // 宋诗             json/poet.song.*.json
    'yuan_opera',           // 元曲             yuanqu/yuanqu.json(注意,原库json格式有问题,转换前要先处理)
    'analects',             // 论语             lunyu/lunyu.json
    'you_meng_ying',        // 幽梦影           youmengying/youmengying.json
]

/**
 * 使用方式
 * genSqlFile有3个参数,分别为
 *      文集代号(见上面数组)
 *      默认生成sql语句文件名称(默认生成init.sql)
 *      是否插入数据库,默认不(如果要插入db,注意配置好db配置,且运行了ddl.sql文件)
 */
// genSqlFile('hua_jian_ji')
// genSqlFile(canGenArr[1], 'shijing')


// 注意,时间不一定准确【*因为使用了append方法写到文件,注意重复生成的数据*】
console.log("开始执行..", new Date());

for (let i = 0; i < canGenArr.length; i++) {
    const e = canGenArr[i];
    // 写到同一个文件
    // genSqlFile(e, `sql/chinese-poetry-${moment().format('YYYYMMDD')}`)
    // 写到不同文件中 【使用前注意sql/dml文件夹已存在】
    genSqlFile(e, `sql/dml/chinese-poetry-${e}-${moment().format('YYYYMMDDHHmmss')}`)
}

console.log("执行完成..", new Date());