//
//  Chinese_2.swift
//  P3
//
//  Created by 文川术 on 2/24/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


class Chinese_2 {

	let character_2_pinyins = [
		["阿", "a", "e"], //
		["癌", "ai"], //, "yan"
		["艾", "ai"], //, "yi"
		["扒", "ba", "pa"], //
		["耙", "ba", "pa"], //
		["柏", "bai", "bo"], //
		["百", "bai"], //, "bo"
		["稗", "bai"], //, "bi"
		["膀", "bang", "pang"], //
		["磅", "bang", "pang"], //
		["蚌", "bang", "beng"], //
		["剥", "bao", "bo"], //
		["薄", "bao", "bo"], //
		["暴", "bao"], //, "pu"
		["被", "bei"], //, "pi"
		["辟", "bi", "pi"], //
		["臂", "bi"], //, "bei"
		["扁", "bian", "pian"], //
		["便", "bian", "pian"], //
		["遍", "bian"], //, "pian"
		["波", "bo"], //, "po"
		["泊", "bo", "po"], //
		["卜", "bo", "bu"], //
		["不", "bu"], //, "fou"
		["蚕", "tian", "can"], //
		["藏", "cang", "zang"], //
		["厕", "ce"], //, "si"
		["茬", "cha"], //, "zha"
		["查", "cha", "zha"], //
		["拆", "chai"], //, "ca"
		["颤", "chan", "zhan"], //
		["长", "chang", "zhang"], //
		["敞", "tang", "chang"], //
		["朝", "chao", "zhao"], //
		["嘲", "chao"], //, "zhao"
		["车", "che", "ju"], //
		["橙", "cheng", "chen"], //
		["乘", "cheng", "sheng"], //
		["澄", "deng", "cheng"], //
		["吃", "chi"], //, "ji"
		["匙", "chi", "shi"], //
		["尺", "chi"], //, "che"
		["虫", "chong"], //, "hui"
		["臭", "chou", "xiu"], //
		["传", "chuan", "zhuan"], //
		["幢", "zhuang"], //, "chuang"
		["绰", "chao", "chuo"], //
		["撮", "cuo", "zuo"], //
		["大", "da", "dai"], //
		["呆", "dai"], //, "ai"
		["掸", "dan"], //, "shan"
		["弹", "dan", "tan"], //
		["得", "de"], //, "dei"
		["的", "de", "di"], //
		["堤", "di"], //, "ti"
		["翟", "di", "zhai"], //
		["底", "di"], //, "de"
		["地", "de", "di"], //
		["佃", "dian"], //, "tian"
		["调", "diao", "tiao"], //
		["丁", "ding"], //, "zheng"
		["侗", "dong", "tong"], //
		["恫", "dong", "tong"], //
		["都", "dou", "du"], //
		["读", "du"], //, "dou"
		["度", "du", "duo"], //
		["堆", "dui"], //, "zui"
		["蹲", "dun"], //, "cun"
		["敦", "dun"], //, "dui"
		["顿", "dun"], //, "du"
		["囤", "dun", "tun"], //
		["盾", "dun"], //, "shun"
		["舵", "duo"], //, "tuo"
//		["堕", "hui", "duo"], //
//		["蛾", "e", "yi"], //
		["堕", "duo"], //, "hui"
		["蛾", "e"], //, "yi"
		["恶", "e", "wu"], //
		["儿", "er"], //, "r"
		["番", "fan", "pan"], //
		["繁", "fan"], //, "po"
		["冯", "feng"], //, "ping"
		["佛", "fo", "fu"], //
		["否", "pi", "fou"], //
		["拂", "fu"], //, "bi"
		["脯", "fu", "pu"], //
		["盖", "gai"], //, "ge"
		["镐", "gao", "hao"], //
		["告", "gao"], //, "gu"
		["胳", "ge"], //, "ga"
		["革", "ge"], //, "ji"
//		["蛤", "ge", "ha"], //
//		["给", "gei", "ji"], //
		["蛤", "ge", "ha"], //
		["给", "gei", "ji"], //
		["汞", "gong"], //, "hong"
		["鼓", "gu"], //, "hu"
		["谷", "gu"], //, "yu"
		["广", "guang"], //, "an"
		["硅", "gui"], //, "huo"
		["哈", "ha"], //, "ka"
		["夯", "hang"], //, "ben"
		["核", "he"], //, "hu"
		["合", "he"], //, "ge"
		["涸", "he"], //, "hao"
		["哼", "heng"], //, "hng"
		["红", "hong"], //, "gong"
		["唬", "hu"], //"xia",
		["哗", "hua"], //, "ye"
		["滑", "hua"], //, "gu"
		["划", "hua"], //, "huai"
		["徊", "huai"], //, "hui"
		["还", "huan", "hai"], //
		["会", "kuai", "hui"], //
		["荤", "hun"], //, "xun"
		["豁", "huo"], //, "hua"
		["稽", "ji", "qi"], //
		["缉", "ji", "qi"], //
		["祭", "zhai", "ji"], //
		["夹", "ga", "jia"], //
		["贾", "gu", "jia"], //
		["价", "jia"], //, "jie"
		["槛", "kan", "jian"], //
		["见", "jian"], //, "xian"
		["将", "jiang"], //, "qiang"
		["降", "jiang", "xiang"], //
		["蕉", "jiao"], //, "qiao"
		["嚼", "jiao", "jue"], //
		["搅", "jiao", "jia"], //
		["铰", "jiao"], //, "jia"
		["狡", "jiao"], //, "jia"
		["饺", "jiao"], //, "jia"
		["绞", "jiao"], //, "jia"
		["酵", "jiao"], //, "xiao"
		["桔", "jie", "ju"], //
		["解", "jie", "xie"], //
		["藉", "jie", "ji"], //
		["芥", "gai", "jie"], //
		["劲", "jing", "jin"], //
		["粳", "geng", "jing"], //
		["景", "jing"], //, "ying"
		["颈", "geng", "jing"], //
		["窘", "jiong"], //, "jun"
		["居", "ju"], //, "ji"
		["咀", "ju"], //, "zui"
		["句", "ju"], //, "gou"
		["卷", "juan", "quan"], //
		["觉", "jiao", "jue"], //
		["均", "jun", "yun"], //
		["浚", "jun", "xun"], //
		["喀", "ka"], //, "ke"
		["咖", "ga", "ka"], //
		["卡", "ka", "qia"], //
		["楷", "kai"], //, "jie"
		["扛", "gang", "kang"], //
		["壳", "ke", "qiao"], //
		["吭", "hang", "keng"], //
		["傀", "gui", "kui"], //
		["溃", "kui"], //, "hui"
		["括", "kuo"], //, "gua"
		["蜡", "la"], //, "zha"
		["腊", "la"], //, "xi"
		["蓝", "lan"], //, "la"
		["姥", "lao", "mu"], //
		["酪", "lao"], //, "luo"
		["烙", "lao", "luo"], //
		["勒", "le", "lei"], //
		["乐", "le", "yue"], //
		["肋", "lei", "le"], //
		["棱", "leng", "ling"], //
		["俩", "liang"], //, "lia"
		["怜", "ling", "lian"], //
		["潦", "lao", "liao"], //
		["了", "le", "liao"], //
		["六", "liu", "lu"], //
		["碌", "lu"], //, "liu"
		["露", "lou", "lu"], //
		["陆", "liu", "lu"], //
		["绿", "lu", "lv"], //
		["纶", "guan", "lun"], //
		["络", "luo"], //, "lao"
		["埋", "mai", "man"], //
		["脉", "mai", "mo"], //
		["蔓", "man", "wan"], //
		["芒", "mang"], //, "wang"
		["冒", "mao"], //, "mo"
		["没", "mei", "mo"], //
		["盟", "meng"], //, "ming"
		["糜", "mei", "mi"], //
		["谜", "mi"], //, "mei"
		["泌", "mi"], //, "bi"
		["娩", "mian"], //, "wan"
		["模", "mo", "mu"], //
		["摩", "ma", "mo"], //
		["抹", "ma", "mo"], //
		["牟", "mou", "mu"], //
		["呐", "na"], //, "ne"
		["那", "na", "nei"], //
		["娜", "na", "nuo"], //
		["鸟", "niao"], //, "diao"
		["弄", "long", "nong"], //
		["努", "nu"], //, "nao"
		["女", "nv"], //, "ru"
		["疟", "nve"], //, "yao",
		["琶", "pa"], //"ba",
		["派", "pai"], //, "pa"
		["旁", "pang"], //, "bang"
		["胖", "pang", "pan"], //
		["刨", "bao", "pao"], //
		["炮", "bao", "pao"], //
		["匹", "pi"], //"ya",
		["苹", "ping"], //, "pin"
		["屏", "bing", "ping"], //
		["迫", "pai", "po"], //
		["剖", "pou"], //, "po"
		["埔", "bu", "pu"], //
		["曝", "bao", "pu"], //
		["瀑", "bao", "pu"], //
		["期", "ji", "qi"], //
		["栖", "qi", "xi"], //
		["其", "qi"], //, "ji"
		["奇", "ji", "qi"], //
		["畦", "qi"], //, "xi"
		["齐", "ji", "qi"], //
		["砌", "qi", "qie"], //
		["泣", "qi"], //, "xie"
		["洽", "qia"], //, "xia"
		["铅", "yan", "qian"], //
		["乾", "gan", "qian"], //
		["浅", "jian", "qian"], //
		["嵌", "kan", "qian"], //
		["强", "jiang", "qiang"], //
		["橇", "qiao"], //, "cui"
		["瞧", "qiao"], //"ya",
		["鞘", "shao", "qiao"], //
		["茄", "jia", "qie"], //
		["且", "qie"], //, "ju"
		["怯", "qie"], //, "que"
		["亲", "qin", "qing"], //
		["沁", "qin"], //, "shen"
		["区", "ou", "qu"], //
		["蛆", "ju", "qu"], //
		["趣", "qu"], //, "cu"
		["圈", "juan", "quan"], //
		["炔", "que", "gui"], //
		["雀", "qiao", "que"], //
		["蠕", "ru"], //, "ruan"
		["若", "ruo"], //, "re"
		["塞", "sai", "se"], //
		["色", "se", "shai"], //
		["莎", "sha", "suo"], //
		["刹", "cha", "sha"], //
		["杉", "shan", "sha"], //
		["裳", "chang", "shang"], //
		["梢", "sao", "shao"], //
		["蛇", "she"], //, "yi"
		["沈", "chen", "shen"], //
		["甚", "shen"], //, "she"
		["省", "xing", "sheng"], //
		["盛", "cheng", "sheng"], //
		["石", "dan", "shi"], //
		["拾", "she", "shi"], //
		["食", "shi", "si"], //
		["识", "shi", "zhi"], //
		["氏", "shi"], //, "zhi"
		["熟", "shou", "shu"], //
		["属", "shu", "zhu"], //
		["术", "shu"], //, "zhu"
		["数", "shu", "shuo"], //
		["衰", "shuai"], //, "cui"
		["谁", "shui"], //, "shei"
		["思", "si"], //, "sai"
		["伺", "ci", "si"], //
		["似", "shi", "si"], //
		["艘", "sou"], //, "sao"
		["宿", "xiu", "su"], //
		["缩", "suo", "su"], //
		["塔", "ta"], //"da",
		["汤", "shang", "tang"], //
		["倘", "tang"], //"chang",
		["陶", "tao"], //, "yao"
		["听", "ting"], //, "yin"
		["凸", "tu"], //"gu",
		["褪", "tui"], //, "tun"
		["驮", "tuo"], //"duo",
		["拓", "ta", "tuo"], //
		["皖", "wan"], //"huan",
		["宛", "wan"], //"yuan",
		["万", "wan"], //, "mo"
		["亡", "wang"], //, "wu"
		["尾", "wei"], //, "yi"
		["蔚", "wei"], //, "yu"
		["尉", "wei", "yu"], //
		["涡", "guo", "wo"], //
		["无", "wu"], //, "mo"
		["溪", "xi"], //, "qi"
		["铣", "xian", "xi"], //
		["洗", "xi"], //, "xian"
		["系", "ji", "xi"], //
		["戏", "xi"], //, "hu"
		["虾", "xia"], //, "ha"
		["厦", "sha", "xia"], //
		["夏", "xia"], //, "jia"
		["吓", "he", "xia"], //
		["纤", "qian", "xian"], //
		["巷", "hang", "xiang"], //
		["削", "xiao", "xue"], //
		["嚣", "xiao"], //, "ao"
		["淆", "xiao"], //"yao",
		["校", "jiao", "xiao"], //
		["蝎", "xie"], //"he",
		["挟", "xie"], // "jia",
		["邪", "xie"], // "ye",
		["斜", "xie"], //, "xia"
		["信", "xin"], // "shen",
		["戌", "xu"], //"qu",
		["嘘", "shi", "xu"], //
		["畜", "chu", "xu"], //
		["血", "xie", "xue"], //
		["寻", "xun"], //"xin",
		["芽", "ya"], //"di",
		["崖", "ya"], //"ai",
		["咽", "yan", "ye"], //
		["烟", "yan"], //, "yin"
		["耀", "yao"], //"yue",
		["掖", "ye"], //, "yi"
		["叶", "xie", "ye"], //
		["腋", "ye"], //, "yi"
		["液", "ye"], //, "yi"
		["遗", "yi"], // "wei",
		["屹", "yi"], // "ge",
		["殷", "yan", "yin"], //
		["涌", "yong"], // "chong",
		["余", "tu", "yu"], //
		["俞", "yu"], //"shu",
		["吁", "xu", "yu"], //
		["育", "yu"], //"yo",
		["员", "yuan", "yun"], //
		["约", "yao", "yue"], //
		["钥", "yue", "yao"], //
		["攒", "cuan", "zan"], //
//		["凿", "zao", "zuo"], //
//		["择", "ze", "zhai"], //
		["凿", "zao"], //, "zuo"
		["择", "ze", "zhai"], //
		["怎", "zen"], //, "ze"
		["曾", "ceng", "zeng"], //
		["扎", "za", "zha"], //
		["喳", "cha", "zha"], //
		["栅", "shan", "zha"], //
		["摘", "zhai"], //, "zhe"
		["宅", "zhai"], //, "zhe"
		["窄", "zhai"], // "ze",
		["粘", "nian", "zhan"], //
		["召", "shao", "zhao"], //
		["折", "she", "zhe"], //
		["锗", "zhe"], //"zang",
		["这", "zhe"], //, "zhei"
		["枝", "zhi"], //, "qi"
		["吱", "zhi", "zi"], //
		["殖", "shi", "zhi"], //
		["峙", "shi", "zhi"], //
		["种", "zhong"], //"chong",
		["重", "chong", "zhong"], //
		["粥", "zhou"], //"yu",
		["爪", "zhao", "zhua"], //
		["拽", "ye", "zhuai"], //
		["转", "zhuan"], //"zhuai",
		["赚", "zhuan"], //"zuan",
		["撞", "zhuang"], //"chuang",
		["椎", "chui", "zhui"], //
		["琢", "zuo", "zhuo"], //
		["兹", "ci", "zi"], //
		["仔", "zai", "zi"], //
		["综", "zeng", "zong"], //
		["足", "ju", "zu"], //
		["卒", "cu", "zu"], //
		["柞", "zha", "zuo"]] //

	let character_3_pinyins = [
		["般", "ban", "pan", "bo"], //
		["堡", "bao", "bu", "pu"], //
		["伯", "bai", "bo"], //"ba",
		["参", "shen", "can", "cen"], //
		["侧", "ce", "ze", "zhai"], //
		["差", "cha", "chai", "ci"], //
		["掺", "can", "chan", "shan"], //
		["称", "chen", "cheng"], //
		["秤", "chen", "cheng"], //
		["单", "chan", "shan", "dan"], //
		["龟", "gui"], //"qiu", , "jun"
		["呵", "a", "he", "ke"], //
		["貉", "hao", "he"], //, "mo"
		["嘿", "hei"], //, "mo", "hai"
		["坏", "pei", "pi", "huai"], //
		["矫", "jiao"], //, "jia", "jiao"
		["侥", "yao", "jiao"], //, "jia"
		["角", "jiao", "jue"], //, "jia"
		["缴", "zhuo", "jiao", "jia"], //
		["剿", "chao", "jiao"], //, "jia"
		["率", "shuai", "lv"], // "shuo",
		["落", "la", "lao", "luo"], //
		["么", "ma", "me"], //, "yao"
		["秘", "bi", "mi"], //, "lin"
		["呢", "ne", "ni"], //, "na"
		["酿", "niang"], //, "nian", "niang"
		["尿", "niao", "sui"], //, "ni"
		["哦", "e", "o"], //, "wo"
		["魄", "po"], //"bo", , "tuo"
		["朴", "piao", "po", "pu"], //
		["漆", "qi"], //, "xi", "qu"
		["契", "qi", "xie"], //, "qie"
		["射", "she"], // "ye",, "shi"
		["娠", "shen"], // "chen", "zhen"
		["什", "shen", "shi"], //, "she"
		["说", "shui", "shuo"], //, "yue"
		["提", "di", "ti"], //"shi",
		["行", "hang", "heng", "xing"], //
		["曳", "ye"], //, "yi", "zhuai"
		["咱", "za", "zan"], //
		["轧", "ya", "zha"], //, "ga"
		["咋", "za", "ze", "zha"], //
		["着", "zhao", "zhe", "zhuo"]]

	let character_4_pinyins = [
		["和", "he", "huo", "hu"], // , "hai"
		["家", "jia"], // , "jie", "gu", "jia"
		["咳", "hai", "ke"], // "ka", "kai",
		["哪", "na", "nai", "nei", "ne"]]

	let character_5_pinyins = [
		["咯", "ge", "ka", "luo"], // "lo",
		["著", "zhu"]] // "zhao", "zhe", , "zhuo", "zi"

}