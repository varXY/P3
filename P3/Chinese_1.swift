//
//  Chinese_1.swift
//  P3
//
//  Created by 文川术 on 2/11/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


class Chinese_1 {

	let pinyinHasMoreThanTwoCharacters = ["a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuan", "chuang", "chui", "chun", "chuo", "ci", "cong", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fou", "fu", "ga", "gai", "gan", "gang", "gao", "ge", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha", "hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "ken", "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lun", "luo", "ma", "mai", "man", "mang", "mao", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "mo", "mou", "mu", "na", "nai", "nan", "nao", "ne", "nei", "ni", "nian", "niang", "niao", "nie", "ning", "niu", "nong", "nu", "nv", "nuo", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "po", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "rong", "rou", "ru", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yo", "yong", "you", "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"]

	let pinyinHasMoreThanThreeCharacters = ["a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu", "cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuan", "chuang", "chui", "chun", "ci", "cong", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fu", "ga", "gai", "gan", "gang", "gao", "ge", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha", "hai", "han", "hang", "hao", "he", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "ken", "kong", "kou", "ku", "kua", "kuai", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lun", "luo", "ma", "mai", "man", "mang", "mao", "mei", "men", "meng", "mi", "mian", "miao", "min", "ming", "mo", "mou", "mu", "na", "nai", "nan", "nao", "ne", "nei", "ni", "nian", "niao", "nie", "ning", "niu", "nong", "nu", "nv", "nuo", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "peng", "pi", "pian", "piao", "pin", "ping", "po", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiu", "qu", "quan", "que", "ran", "rang", "rao", "re", "ren", "rong", "rou", "ru", "ruan", "rui", "sa", "sai", "san", "sang", "sao", "se", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou", "shu", "shuai", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tui", "tun", "tuo", "wa", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"]

//	let confusablePinyinsForSelectTheSame = [
//		["a", "ai", "an", "ao"],
//		["a", "an", "ang", "ao"],
//
//		["ba", "bai", "bei", "bie"],
//		["ba", "bai", "ban", "bang"],
//		["bei", "ben", "beng", "bie"],
//		["bai", "bian", "biao", "bie"],
//		["ba", "bi", "bin", "bing"],
//
//	]

	let confusablePinyinsForSelectTheSame = [
		["a", "ai", "an", "ang", "ao"],
		["ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu"],
		["cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuan", "chuang", "chui", "chun", "ci", "cong", "cu", "cuan", "cui", "cun", "cuo"],
		["da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "dong", "dou", "du", "duan", "dui", "dun", "duo"],
		["fa", "fan", "fang", "fei", "fen", "feng", "fu"],
		["ga", "gai", "gan", "gang", "gao", "ge", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo"],
		["ha", "hai", "han", "hang", "hao", "he", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo"],
		["ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiu", "ju", "juan", "jue", "jun"],
		["ka", "kai", "kan", "kang", "kao", "ke", "ken", "kong", "kou", "ku", "kua", "kuai", "kuang", "kui", "kun", "kuo"],
		["la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lun", "luo"],
		["ma", "mai", "man", "mang", "mao", "mei", "men", "meng", "mi", "mian", "miao", "min", "ming", "mo", "mou", "mu"],
		["na", "nai", "nan", "nao", "ne", "nei", "ni", "nian", "niao", "nie", "ning", "niu", "nong", "nu", "nv", "nuo"],
		["pa", "pai", "pan", "pang", "pao", "pei", "peng", "pi", "pian", "piao", "pin", "ping", "po", "pu"],
		["qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiu", "qu", "quan", "que"],
		["ran", "rang", "rao", "re", "ren", "rong", "rou", "ru", "ruan", "rui"],
		["sa", "sai", "san", "sang", "sao", "se", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou", "shu", "shuai", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo"],
		["ta", "tai", "tan", "tang", "tao", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tui", "tun", "tuo"],
		["wa", "wan", "wang", "wei", "wen", "weng", "wo", "wu"],
		["xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun"],
		["ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan", "yue", "yun"],
		["za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"],
	]

	func randomPinyin() -> String {
		let randomNumber = getRandomNumbers(1, lessThan: pinyinHasMoreThanTwoCharacters.count)
		return pinyinHasMoreThanTwoCharacters[randomNumber[0]]
	}
}


















