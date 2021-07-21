// 初始化文件栏位
let initCorpusMap = () => {
    // 注意，这个是执行文件index.js下关于 chinese-poetry 库的相对位置
    let initPathPrefix = './chinese-poetry-master'

    // 各个json文件对应的栏位数据信息
    let corpusMap = new Map();

    // 诗经
    corpusMap.set('the_book_of_songs', {                          // 文集代号
        jsonPath: initPathPrefix + '/shijing/shijing.json',       // 一定要正确写入原库json文件的位置
        isDir: false,                                             // 是否是文件夹
        tableName: 'the_book_of_songs',                           // 数据库中的表名
        fieldArr: ['title', 'chapter', 'section', 'content'],     // 数据库中的栏位 fieldArr=jsonFieldArr+jsonArrayArr，且位置一致
        jsonFieldArr: ['title', 'chapter', 'section'],            // json文件中不需要处理，直接存入db的栏位
        jsonArrayArr: ['content']                                 // json文件中为数组，需要拼接到一起之后再存入的栏位
    })

    // 楚辞
    corpusMap.set('songs_of_chu', {
        jsonPath: initPathPrefix + '/chuci/chuci.json',
        isDir: false,
        tableName: 'songs_of_chu',
        fieldArr: ['title', 'section', 'author', 'content'],
        jsonFieldArr: ['title', 'section', 'author'],
        jsonArrayArr: ['content']
    })

    // 曹操诗
    corpusMap.set('caocao_poetry', {
        jsonPath: initPathPrefix + '/caocaoshiji/caocao.json',
        isDir: false,
        tableName: 'caocao_poetry',
        fieldArr: ['title', 'paragraphs'],
        jsonFieldArr: ['title'],
        jsonArrayArr: ['paragraphs']
    })

    // 唐诗
    corpusMap.set('tang_poetry', {
        jsonPath: initPathPrefix + '/json',
        isDir: true,
        prefix: 'poet.tang.',       // 符合唐诗的该文件夹中json文件前缀
        tableName: 'tang_poetry',
        fieldArr: ['author', 'title', 'paragraphs'],
        jsonFieldArr: ['author', 'title'],
        jsonArrayArr: ['paragraphs']
    })

    // 花间集
    corpusMap.set('hua_jian_ji', {
        jsonPath: initPathPrefix + '/wudai/huajianji',
        isDir: true,
        prefix: 'huajianji-',       // 符合花间集的该文件夹中json文件前缀
        exclude: 'huajianji-0',     // 不符合花间集的该文件夹中json文件前缀(这是个序言)
        tableName: 'hua_jian_ji',
        fieldArr: ['rhythmic', 'title', 'author', 'paragraphs', 'notes'],
        jsonFieldArr: ['rhythmic', 'title', 'author'],
        jsonArrayArr: ['paragraphs', 'notes']
    })

    // 南唐二主词
    corpusMap.set('nan_tang_er_zhu_ci', {
        jsonPath: initPathPrefix + '/wudai/nantang/poetrys.json',
        isDir: false,
        tableName: 'nan_tang_er_zhu_ci',
        fieldArr: ['rhythmic', 'title', 'author', 'paragraphs', 'notes'],
        jsonFieldArr: ['rhythmic', 'title', 'author'],
        jsonArrayArr: ['paragraphs', 'notes']
    })

    // 宋词
    corpusMap.set('song_ci', {
        jsonPath: initPathPrefix + '/ci',
        isDir: true,
        prefix: 'ci.song.',       // 符合宋诗的该文件夹中json文件前缀
        tableName: 'song_ci',
        fieldArr: ['author', 'rhythmic', 'paragraphs'],
        jsonFieldArr: ['author', 'rhythmic'],
        jsonArrayArr: ['paragraphs']
    })


    // 宋诗
    corpusMap.set('song_poetry', {
        jsonPath: initPathPrefix + '/json',
        isDir: true,
        prefix: 'poet.song.',       // 符合宋诗的该文件夹中json文件前缀
        tableName: 'song_poetry',
        fieldArr: ['author', 'title', 'paragraphs'],
        jsonFieldArr: ['author', 'title'],
        jsonArrayArr: ['paragraphs']
    })

    // 元曲
    corpusMap.set('yuan_opera', {
        jsonPath: initPathPrefix + '/yuanqu/yuanqu.json',
        isDir: false,
        isYuanOpera: true,          // 20210721 如果是元曲，要先格式化原库的数据为正确的json格式
        tableName: 'yuan_opera',
        fieldArr: ['author', 'title', 'paragraphs'],
        jsonFieldArr: ['author', 'title'],
        jsonArrayArr: ['paragraphs']
    })

    // 论语
    corpusMap.set('analects', {
        jsonPath: initPathPrefix + '/lunyu/lunyu.json',
        isDir: false,
        tableName: 'analects',
        fieldArr: ['chapter', 'paragraphs'],
        jsonFieldArr: ['chapter'],
        jsonArrayArr: ['paragraphs']
    })

    // 幽梦影
    corpusMap.set('you_meng_ying', {
        jsonPath: initPathPrefix + '/youmengying/youmengying.json',
        isDir: false,
        tableName: 'you_meng_ying',
        fieldArr: ['content', 'comment'],
        jsonFieldArr: ['content'],
        jsonArrayArr: ['comment']
    })

    return corpusMap;
}

const corpusMap = initCorpusMap();

// 导出的是map实例
module.exports = corpusMap;

