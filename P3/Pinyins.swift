//
//  Pinyins.swift
//  Pinyin Comparison
//
//  Created by 文川术 on 3/30/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Pinyins {

	let allPossiblePinyin = ["a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "cen", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuai", "chuan", "chuang", "chui", "chun", "chuo", "ci", "cong", "cou", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga", "gai", "gan", "gang", "gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha", "hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "ken", "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "lve", "luan", "lun", "luo", "ma", "mai", "man", "mang", "mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na", "nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ni", "nian", "niang", "niao", "nie", "nin", "ning", "niu", "nong", "nu", "nv", "nve","nuan", "nuo", "o", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "po", "pou", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou", "ru", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sen", "seng", "sha", "shai", "shan", "shang", "shao", "she", "shei", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yo", "yong", "you", "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"]



	let confusablePinyin_Different = [

		//--------------------------- a

		"a ai",
		"ai ao",

		// - g
		"an ang",

		// join e
		"a e",
		"a er",

		//--------------------------- b

		"bai bei",
		"bo bu",

		// - g
		"ban bang",
		"ben beng",
		"bin bing",

		// join t
		"bo tuo",

		//--------------------------- c

		"dou diu",

		// - h
		"ca cha",
		"cu chu",
		"ci chi",
		"cen chen",
		"ceng cheng",
		"chan chang",

		// - g
		"cen ceng",
		"chen cheng",
		"chou cou",
		"chuan chuang",
		"dan dang",

		//--------------------------- e

		"er e",

		// join o
		"er o",
		"er ou",
		"e o",
		"e ou",

		//--------------------------- f

		"fo fou",
		"fo fu",

		// - g
		"fan fang",
		"fen feng",

		//--------------------------- g

		"gong gun",

		// - g
		"gan gang",
		"gen geng",
		"guan guang",

		//--------------------------- h

		"hai hei",
		"hui hun",
		"hun huo",
		"hua huai",

		// - g
		"han hang",
		"hen heng",
		"huan huang",

		// join k
		"huai kuai",

		//--------------------------- j

		"jia jie",
		"jiong jiu",
		"juan jue",
		"jiu ju",

		// - g
		"jin jing",
		"jian jiang",

		// join z
		"ji zhi",


		//--------------------------- k

		"ka kai",
		"kui kuo",
		"ka ke",
		"kong kou",
		"kui kuo",

		// join h
		"kuai huai",

		// - g
		"kan kang",
		"ken keng",
		"kuan kuang",

		//--------------------------- l

		"le lei",
		"lian liao",
		"le lie",
		"la lai",
		"lu lv",
		"lie lv",

		// join n
		"long nong",

		// - g
		"lan lang",
		"lian liang",
		"lin ling",

		// join n
		"liu niu",
		"ling ning",
		"lin ning",
		"lin nin",
		"lao nao",
		"li ni",
		"lei nei",
		"lian nian",
		"liao niao",
		"luan nuan",
		"le ne",

		//--------------------------- m

		"ma mai",
		"mei mie",
		"mao miao",
		"miu mou",
		"mo me",
		"mo mou",

		// - g
		"man mang",
		"men meng",
		"min ming",

		//--------------------------- n

		"nai nei",
		"nao niao",
		"ne nei",
		"nu nv",
		"nu nuo",

		// - g
		"nan nang",
		"nen neng",
		"nian niang",
		"nin ning",

		// join m
		"nuo mou",

		//--------------------------- o

		"o ou",

		//--------------------------- p

		"pai pang",
		"pa pai",
		"pei pie",
		"pou pu",
		"po pou",

		// - g
		"pan pang",
		"pen peng",
		"pin ping",

		// join b
		"pao bao",

		//--------------------------- q

		"qia qiang",
		"qiu que",

		// - g
		"qian qiang",
		"qin qing",

		//--------------------------- r

		"re ri",

		// - g
		"ran rang",
		"ren reng",

		// join y
		"ruan yuan",
		"ren yin",
		"re ye",

		//--------------------------- s

		// - h
		"sa sha",
		"sai shai",
		"san shan",
		"sang shang",
		"sao shao",
		"se she",
		"sen shen",
		"seng sheng",
		"si shi",
		"sou shou",
		"su shu",
		"suan shuan",
		"sun shun",
		"suo shuo",
		"sui shui",

		// - g
		"san sang",
		"sen seng",
		"shan shang",
		"shen sheng",
		"shuan shuang",

		//--------------------------- t

		"tou tuo",
		"tie tian",

		// - g
		"tan tang",

		//--------------------------- w

		"wa wei",
		"wai wei",

		// - g
		"wan wang",
		"wen weng",

		//--------------------------- x

		"xie xue",
		"xiu xu",

		// - g
		"xian xiang",
		"xin xing",

		//--------------------------- y

		"yan yao",
		"yan ye",
		"yue yun",
		"yo you",

		// - g
		"yan yang",
		"yin ying",

		//--------------------------- z

		// - h
		"za zha",
		"zai zhai",
		"zan zhan",
		"zang zhang",
		"zao zhao",
		"ze zhe",
		"zen zhen",
		"zeng zheng",
		"zi zhi",
		"zong zhong",
		"zou zhou",
		"zu zhu",
		"zuan zhuan",
		"zui zhui",
		"zun zhun",
		"zuo zhuo",

		// - g
		"zan zang",
		"zen zeng",
		"zhan zhang",
		"zhen zheng",
		"zhuan zhuang",

		]



	let confusablePinyinOfWord_Different = [

		//--------------------------- a

		"ai mei-an wei",
		"an shui-an shu",
		"an li-an qi",

		//--------------------------- b

		"ba zi-bai zhi",
		"bang zi-ban zi",
		"ben shen-bie shuo",
		"bao chang-bao cang",
		"bian chi-bian ci",
		"biao zhi-biao zi",
		"biao shi-biao shu",
		"ben zi-ben zhi",
		"bi xi-bi xing",
		"bian min-bian men",
		"biao shi-bian zhi",
		"bu chi-bu ci",
		"bu chang-bu cheng",
		"bo mu-bo wu",
		"bo di-biao di",
		"bu man-bu mian",
		"bu xiang-bu xiao",
		"bu xie-bu xiu",

		//--------------------------- c

		"can yu-cang yu",
		"chan xiao-chang xiao",
		"chan yuan-chang yuan",
		"chan shi-chang shi",
		"chan fu-chang fu",
		"chan fang-chang fang",
		"chan jia-chang jia",

		"chen yu-cheng yu",
		"chen bao-cheng bao",
		"chen ji-cheng ji",
		"chen qing-cheng qing",
		"chen shi-cheng shi",
		"chen yi-cheng yi",
		"chen fu-cheng fu",
		"chen yuan-cheng yuan",
		"chen zhi-cheng zhi",

		"chuan wei-chuang wei",
		"chuan yan-chuang yan",
		"chuan zi-chuang zi",
		"chuan yi-chuang yi",

		"cai zhi-cai shi",
		"ce shi-ce zi",
		"cha shi-chai shi",
		"chan shi-chang shi",
		"cheng xian-cheng xiang",
		"cheng shi-chen shi",
		"cheng fu-chen fu",
		"chu shen-chu sheng",
		"chu si-chu zhi",
		"ci zi-chi zi",
		"ci yu-chi yu",
		"cun shi-cu shi",

		//--------------------------- d

		"da jian-da jie",
		"da hua-da huo",
		"da ba-da bai",
		"da fu-dai fu",
		"da shi-da si",
		"da xiao-da xiang",
		"da yi-da yin",
		"da zhong-da zong",
		"di zi-di zhi",
		"dao zi-dao zhi",
		"diao zi-diao zhi",
		"ding xin-ding xing",
		"dou zi-dou zhi",
		"dun shi-duo shi",

		"dan shi-dang shi",
		"dan jia-dang jia",
		"dan gui-dang gui",
		"dan ji-dang ji",
		"dan xin-dang xin",

		//--------------------------- e

		"e zhi-er zi",

		//--------------------------- f

		"fan shi-fang shi",
		"fan xiang-fang xiang",
		"fan xin-fang xin",
		"fan shen-fang shen",
		"fan wei-fang wei",
		"fan zhi-fang zhi",
		"fan dong-fang dong",
		"fan ji-fang ji",
		"fan jian-fang jian",
		"fan fu-fang fu",
		"fan xing-fang xing",
		"fan gu-fang gu",
		"fan du-fang du",
		"fan qing-fang qing",
		"fan si-fang si",

		"fan jian-fang jia",
		"fa yan-fa yang",
		"fa zi-fa zhi",

		"fen hua-feng hua",
		"fen shi-feng shi",
		"fen xiang-feng xiang",
		"fen zi-feng zi",
		"fen bi-feng bi",
		"fen zhi-feng zhi",
		"fen li-feng li",
		"fen mi-feng mi",
		"fen qi-feng qi",
		"fen ji-feng ji",

		"feng fan-fen fang",

		"fu shen-fu sheng",
		"fu hua-fu han",
		"fu qian-fu qiang",
		"fu se-fu she",
		"fu shen-fu sheng",
		"fu ti-fu tie",
		"fu xian-fu xiang",
		"fu xin-fu xing",
		"fu zi-fu zhi",
		"fu ze-fu zheng",
		"fo dian-fu dian",

		//--------------------------- g

		"gao jie-gao ji",
		"gao yang-gao yao",
		"gao zi-gao zhi",

		"gan ji-gan jin",
		"gan jing-gang jing",
		"gan zi-gang zi",
		"gan cai-gang cai",
		//		"gan dang-gang dang",
		"gan huo-gang huo",
		"gan hua-gang hua",
		//		"gan yan-gang yan",
		"gan jing-gang jing",
		"gan zi-gang zi",
		"gan jing-gan jin",
		"gan lian-gan lie",
		"gan zi-gan zhi",

		"ge xin-ge xing",
		"ge zi-ge zhi",
		"ge jie-ge jue",

		"guan xian-guang xian",
		//		"guan zi-guang zi",
		"guan fu-guang fu",
		"guan cai-guang cai",

		"guo zi-guo zhi",
		"guo lu-guo lv",

		"gu zi-gu zhi",
		"gu zhen-gu zheng",
		"gu fen-gu feng",
		"gu mu-gu mo",

		"gui zi-gui zhi",

		"gong che-gong cheng",
		"gong fen-gong feng",
		"gong guo-gong gu",
		"gong jin-gong jing",
		"gong shen-gong sheng",
		"gong si-gong shi",
		"gong xin-gong xing",
		"gong zi-gong zhi",

		//--------------------------- h

		"huan ji-huang ji",
		"huan yang-huang yang",
		"huan you-huang you",
		"huan yu-huang yu",
		"huan cheng-huang cheng",
		"huan yan-huang yan",

		//--------------------------- j

		"jian xi-jiang xi",
		"jian shi-jiang shi",
		"jian zhi-jiang zhi",
		"jian hua-jiang hua",
		"jian jie-jiang jie",
		"jian bei-jiang bei",
		"jian fa-jiang fa",
		"jian jin-jiang jin",
		"jian li-jiang li",
		"jian xin-jiang xin",
		"jian hao-jiang hao",
		"jian jia-jiang jia",
		"jian sheng-jiang sheng",
		"jian yu-jiang yu",
		"jian cai-jiang cai",

		"jian huo-jie huo",
		"jian ji-jie ji",
		"jian shou-jie shou",
		"jian di-jie di",
		"jian duan-jie duan",
		"jian shi-jie shi",
		"jian tou-jie tou",
		"jian li-jie li",
		"jian sheng-jie sheng",
		"jian yu-jie yu",
		"jian zhi-jie zhi",
		"jian ju-jie ju",
		"jian guo-jie guo",
		"jian jia-jie jia",
		"jian jiao-jie jiao",
		"jian jie-jie jie",
		"jian shu-jie shu",
		"jian yi-jie yi",
		"jian mian-jie mian",
		"jian jin-jie jin",
		"jian fu-jie fu",
		"jian du-jie du",
		"jian fa-jie fa",
		"jian gu-jie gu",
		"jian ke-jie ke",
		"jian yue-jie yue",
		"jian xin-jie xin",
		"jian yan-jie yan",
		"jian cai-jie cai",
		"jian bei-jie bei",
		"jian xian-jie xian",
		"jian zhu-jie zhu",

		"jin du-jing du",
		"jin ji-jing ji",
		"jin li-jing li",
		"jin ju-jing ju",
		"jin qi-jing qi",
		"jin xian-jing xian",
		"jin yan-jing yan",
		"jin yi-jing yi",
		"jin shi-jing shi",
		"jin dao-jing dao",
		"jin liang-jing liang",
		"jin shen-jing shen",
		"jin zhi-jing zhi",
		"jin yu-jing yu",
		"jin sheng-jing sheng",
		"jin xiang-jing xiang",
		"jin di-jing di",
		"jin fang-jing fang",
		"jin zhong-jing zhong",
		"jin zi-jing zi",
		"jin xiao-jing xiao",
		"jin ran-jing ran",
		"jin ye-jing ye",
		"jin tou-jing tou",

		"jiu yi-jue yi",
		"jiu di-jue di",
		"jiu ji-jue ji",
		"jiu jing-jue jing",
		"jiu shi-jue shi",

		//--------------------------- k

		"kuan chang-kuang chang",

		//--------------------------- l

		"lian yi-liang yi",
		"lian ji-liang ji",
		"lian mian-liang mian",
		"lian xiang-liang xiang",

		"lian xi-lie xi",

		"lin li-ling li",
		"lin zi-ling zi",
		"lin xing-ling xing",
		"lin yu-ling yu",

		//--------------------------- m

		"mo zi-mu zi",
		"mo ji-mu ji",
		"mo li-mu li",
		"mo yu-mu yu",
		"mo di-mu di",
		"mo shi-mu shi",
		"mo zhi-mu zhi",
		"mo qi-mu qi",

		//--------------------------- p

		"pin fu-ping fu",
		"pin wei-ping wei",

		//--------------------------- q

		"qian bi-qiang bi",
		"qian jian-qiang jian",
		"qian ren-qiang ren",
		"qian shou-qiang shou",
		"qian zhan-qiang zhan",
		"qian zhi-qiang zhi",
		"qian gong-qiang gong",
		"qian xian-qiang xian",
		"qian yan-qiang yan",

		"qin sheng-qing sheng",
		"qin shi-qing shi",
		"qin xian-qing xian",
		"qin zheng-qing zheng",
		"qin jian-qing jian",
		"qin jin-qing jin",

		//--------------------------- r

		"rong he-rou he",

		//--------------------------- s

		"shan ji-shang ji",
		"shan jian-shang jian",
		"shan shi-shang shi",
		"shan feng-shang feng",
		"shan huo-shang huo",
		"shan liang-shang liang",
		"shan lu-shang lu",
		"shan shen-shang shen",
		"shan xian-shang xian",
		"shan xiang-shang xiang",
		"shan xing-shang xing",

		"shen cai-sheng cai",
		"shen li-sheng li",
		"shen qi-sheng qi",
		"shen se-sheng se",
		"shen shi-sheng shi",
		"shen si-sheng si",
		"shen xiao-sheng xiao",
		"shen yi-sheng yi",
		"shen yu-sheng yu",
		"shen zhi-sheng zhi",
		"shen bian-sheng bian",
		"shen ming-sheng ming",
		"shen wei-sheng wei",
		"shen yuan-sheng yuan",
		"shen chu-sheng chu",
		"shen su-sheng su",
		"shen zi-sheng zi",
		"shen ling-sheng ling",
		"shen shou-sheng shou",
		"shen xing-sheng xing",
		"shen yan-sheng yan",

		"si jian-shi jian",
		"si li-shi li",
		"si shi-shi shi",
		"si shou-shi shou",
		"si yi-shi yi",
		"si di-shi di",
		"si zi-shi zi",
		"si hua-shi hua",
		"si ji-shi ji",
		"si jiao-shi jiao",
		"si xing-shi xing",
		"si yu-shi yu",
		"si zhi-shi zhi",
		"si jin-shi jin",
		"si fang-shi fang",
		"si hui-shi hui",
		"si mian-shi mian",
		"si qi-shi qi",
		"si ying-shi ying",
		"si ren-shi ren",
		"si shang-shi shang",
		"si xian-shi xian",
		"si xin-shi xin",
		"si huo-shi huo",
		"si xiang-shi xiang",
		"si ming-shi ming",
		"si shu-shi shu",
		"si liao-shi liao",
		"si fa-shi fa",
		"si gu-shi gu",
		"si qing-shi qing",
		"si wei-shi wei",
		"si dang-shi dang",

		"shu yuan-su yuan",
		"shu cai-su cai",
		"shu jing-su jing",
		"shu zhuang-su zhuang",
		"shu hua-su hua",
		"shu di-su di",
		"shu ji-su ji",
		"shu ming-su ming",

		"shui yuan-sui yuan",
		"shui shou-sui shou",
		"shui yi-sui yi",

		//--------------------------- t

		"tan zhi-tang zhi",
		"tan shang-tang shang",

		"tian qi-tie qi",
		"tian xian-tie xian",

		"tou xian-tu xian",
		"tou ding-tu ding",
		"tou ji-tu ji",
		"tou shi-tu shi",
		"tou jing-tu jing",
		"tou lu-tu lu",
		"tou di-tu di",
		"tou zhi-tu zhi",
		"tou zi-tu zi",

		//--------------------------- w

		"wan shi-wang shi",
		"wan zi-wang zi",
		"wan nian-wang nian",
		"wan yan-wang yan",
		"wan ji-wang ji",
		"wan sheng-wang sheng",

		"wai yi-wei yi",
		"wai li-wei li",
		"wai xing-wei xing",
		"wai shi-wei shi",
		"wai wu-wei wu",
		"wai qi-wei qi",
		"wai xie-wei xie",
		"wai bu-wei bu",
		"wai jing-wei jing",
		"wai yu-wei yu",
		"wai dao-wei dao",

		"wo ju-wu ju",

		//--------------------------- x

		"xian cheng-xiang cheng",
		"xian fan-xiang fan",
		"xian ji-xiang ji",
		"xian jian-xiang jian",
		"xian ju-xiang ju",
		"xian ren-xiang ren",
		"xian shi-xiang shi",
		"xian shu-xiang shu",
		"xian xiang-xiang xiang",
		"xian yi-xiang yi",
		"xian yu-xiang yu",
		"xian zhi-xiang zhi",
		"xian chang-xiang chang",
		"xian gu-xiang gu",
		"xian hui-xiang hui",
		"xian wei-xiang wei",
		"xian yan-xiang yan",
		"xian you-xiang you",
		"xian fang-xiang fang",
		"xian cai-xiang cai",
		"xian di-xiang di",
		"xian li-xiang li",
		"xian jin-xiang jin",
		"xian bei-xiang bei",
		"xian jie-xiang jie",
		"xian ming-xiang ming",
		"xian qing-xiang qing",
		"xian tan-xiang tan",
		"xian he-xiang he",
		"xian qi-xiang qi",
		"xian sheng-xiang sheng",
		"xian tou-xiang tou",
		"xian zi-xiang zi",
		"xian hua-xiang hua",

		"xin shi-xing shi",
		"xin ji-xing ji",
		"xin qi-xing qi",
		"xin xiang-xing xiang",
		"xin xing-xing xing",
		"xin jing-xing jing",
		"xin li-xing li",
		"xin lv-xing lv",
		"xin shu-xing shu",
		"xin zhi-xing zhi",
		"xin sheng-xing sheng",
		"xin mu-xing mu",
		"xin ren-xing ren",
		"xin zi-xing zi",
		"xin xi-xing xi",
		"xin bing-xing bing",
		"xin ling-xing ling",
		"xin zheng-xing zheng",

		"xu shi-xiu shi",
		"xu shu-xiu shu",
		"xu xian-xiu xian",
		"xu yang-xiu yang",
		"xu zhi-xiu zhi",
		"xu yu-xiu yu",

		"xie li-xue li",
		"xie shi-xue shi",
		"xie zhi-xue zhi",
		"xie zi-xue zi",
		"xie xian-xue xian",
		"xie qi-xue qi",
		"xie tong-xue tong",
		"xie yi-xue yi",

		//--------------------------- y

		"yan qi-yang qi",
		"yan gao-yang gao",
		"yan ji-yang ji",
		"yan shou-yang shou",
		"yan yan-yang yan",
		"yan chang-yang chang",
		"yan hua-yang hua",
		"yan huo-yang huo",
		"yan shi-yang shi",
		"yan wen-yang wen",
		"yan zhuang-yang zhuang",
		"yan bo-yang bo",
		"yan guang-yang guang",
		"yan mian-yang mian",
		"yan mu-yang mu",
		"yan fu-yang fu",
		"yan xing-yang xing",
		"yan yu-yang yu",
		"yan zi-yang zi",
		"yan yang-yang yang",
		"yan shu-yang shu",

		"ya zhi-ye zhi",
		"ya yu-ye yu",
		"ya zi-ye zi",
		"ya yan-ye yan",
		"ya jing-ye jing",

		"ye ban-yi ban",
		"ye ji-yi ji",
		"ye jing-yi jing",
		"ye shi-yi shi",
		"ye zhi-yi zhi",
		"ye wu-yi wu",
		"ye yan-yi yan",
		"ye zhu-yi zhu",
		"ye mian-yi mian",
		"ye zi-yi zi",
		"ye xing-yi xing",
		"ye yu-yi yu",
		"ye ma-yi ma",
		"ye qu-yi qu",
		"ye jian-yi jian",

		"yin ji-ying ji",
		"yin jie-ying jie",
		"yin shi-ying shi",
		"yin yun-ying yun",
		"yin li-ying li",
		"yin yong-ying yong",
		"yin zi-ying zi",
		"yin su-ying su",
		"yin yu-ying yu",
		"yin yang-ying yang",
		"yin ping-ying ping",
		"yin xiang-ying xiang",
		"yin bi-ying bi",
		"yin gong-ying gong",
		"yin hua-ying hua",
		"yin jian-ying jian",
		"yin qi-ying qi",
		"yin xing-ying xing",
		"yin zhang-ying zhang",

		"you hui-yu hui",
		"you ji-yu ji",
		"you jin-yu jin",
		"you li-yu li",
		"you sheng-yu sheng",
		"you wei-yu wei",
		"you lun-yu lun",
		"you qu-yu qu",
		"you chang-yu chang",
		"you ren-yu ren",
		"you zhong-yu zhong",
		"you qi-yu qi",
		"you hua-yu hua",
		"you yi-yu yi",
		"you ju-yu ju",
		"you liang-yu liang",
		"you lin-yu lin",
		"you lu-yu lu",
		"you qing-yu qing",
		"you shi-yu shi",
		"you shui-yu shui",
		"you jing-yu jing",
		"you yin-yu yin",
		"you dai-yu dai",
		"you er-yu er",
		"you fen-yu fen",
		"you yu-yu yu",
		"you bu-yu bu",
		"you gou-yu gou",
		"you jian-yu jian",
		"you shou-yu shou",
		"you xi-yu xi",
		"you xing-yu xing",
		"you zhi-yu zhi",
		"you nian-yu nian",
		"you di-yu di",
		"you wu-yu wu",
		"you yuan-yu yuan",
		"you xian-yu xian",


		//--------------------------- z

		"za ji-zha ji",
		"za shi-zha shi",

		"zhan shi-zhang shi",
		"zhan fang-zhang fang",
		"zhan li-zhang li",

		"zao shi-zhao shi",
		"zao qi-zhao qi",
		"zao shu-zhao shu",

		"zhen fa-zheng fa",
		"zhen xiang-zheng xiang",
		"zhen yan-zheng yan",
		"zhen jiao-zheng jiao",
		"zhen di-zheng di",
		"zhen ji-zheng ji",
		"zhen yi-zheng yi",
		"zhen zhi-zheng zhi",
		"zhen ban-zheng ban",
		"zhen dang-zheng dang",
		"zhen jing-zheng jing",
		"zhen pin-zheng pin",
		"zhen shi-zheng shi",
		"zhen zhong-zheng zhong",
		"zhen jie-zheng jie",

		"zhi li-zi li",
		"zhi zhu-zi zhu",
		"zhi sheng-zi sheng",
		"zhi shi-zi shi",
		"zhi di-zi di",
		"zhi fang-zi fang",
		"zhi ji-zi ji",
		"zhi xi-zi xi",
		"zhi zhi-zi zhi",
		"zhi wei-zi wei",
		"zhi mian-zi mian",
		"zhi yin-zi yin",
		"zhi bao-zi bao",
		"zhi bei-zi bei",
		"zhi bian-zi bian",
		"zhi cheng-zi cheng",
		"zhi da-zi da",
		"zhi fu-zi fu",
		"zhi hao-zi hao",
		"zhi hui-zi hui",
		"zhi jian-zi jian",
		"zhi jin-zi jin",
		"zhi jing-zi jing",
		"zhi jue-zi jue",
		"zhi liu-zi liu",
		"zhi shen-zi shen",
		"zhi shu-zi shu",
		"zhi si-zi si",
		"zhi wen-zi wen",
		"zhi xiao-zi xiao",
		"zhi xin-zi xin",
		"zhi xing-zi xing",
		"zhi yi-zi yi",
		"zhi you-zi you",
		"zhi yu-zi yu",
		"zhi yuan-zi yuan",
		"zhi zhong-zi zhong",
		"zhi bi-zhi bu",

		"zhuan jia-zhuang jia",
		"zhuan yuan-zhuang yuan",
		"zhuan zi-zhuang zi",
		"zhuan shi-zhuang shi",
		"zhuan xiang-zhuang xiang",
		"zhuan zhi-zhuang zhi",
		"zhuan che-zhuang che",
		"zhuan ji-zhuang ji",

		"zhong shi-zong shi",
		"zhong shu-zong shu",
		"zhong he-zong he",
		"zhong ji-zong ji",
		"zhong zhi-zong zhi",
		"zhong shen-zong shen",
		
		"zhu jie-zu jie",
		"zhu zi-zu zi",
		"zhu ji-zu ji",
		"zhu zhi-zu zhi",
		"zhu ge-zu ge",
		"zhu jian-zu jian",
		"zhu shi-zu shi",
		"zhu ye-zu ye",
		
		"zuo jian-zhuo jian",
		"zuo shi-zhuo shi",
		"zuo yi-zhuo yi",
		"zuo zi-zhuo zi",
		
		]
}