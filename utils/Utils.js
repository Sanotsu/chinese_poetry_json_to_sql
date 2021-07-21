// 匹配中文标点符号 (不是中文的现在搞不定,但json里面还真有英文的?等等)
/**
 * 非中文标点符号换行的数目:
 * 楚辞     1
 * 
 */
isChinesePunctuation = (text) => {
    //匹配这些中文标点符号 。 ？ ！ ， 、 ； ： “ ” ‘ ' （ ） 《 》 〈 〉 【 】 『 』 「 」 ﹃ ﹄ 〔 〕 … — ～ ﹏ ￥
    let reg = /[\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]/;

    if (reg.test(text)) {
        return true;
    } else {
        return false;
    }
}

module.exports = {
    isChinesePunctuation
}