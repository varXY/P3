//
//  Trash_4.swift
//  P3
//
//  Created by 文川术 on 2/12/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


class Trash_4 {

	let W = ["wa wa",
	"wa zi",
	"wai bu",
	"wai dao",
	"wai di",
	"wai gong",
	"wai jia",
	"wai jiao",
	"wai jie",
	"wai jing",
	"wai ke",
	"wai li",
	"wai lu",
	"wai mao",
	"wai qi",
	"wai qin",
	"wai shang",
	"wai shi",
	"wai tao",
	"wai wu",
	"wai xiang",
	"wai xie",
	"wai xing",
	"wai xing ren",
	"wai yi",
	"wai yin",
	"wai yu",
	"wai yuan",
	"wan yao",
	"wan zi",
	"wan ji",
	"wan shi",
	"wan zheng",
	"wan bei",
	"wan dao",
	"wan hui",
	"wan hun",
	"wan jie",
	"wan shang",
	"wan sheng",
	"wan yan",
	"wan er",
	"wan ci",
	"wan ju",
	"wan quan",
	"wan ban",
	"wan gu",
	"wan min",
	"wan nian",
	"wan wu",
	"wan zhang",
	"wang gong",
	"wang guo",
	"wang hou",
	"wang shi",
	"wang ba",
	"wang guan",
	"wang luo",
	"wang ye",
	"wang you",
	"wang zi",
	"wang fu",
	"wang wang",
	"wang fa",
	"wang fei",
	"wang ran",
	"wang jia",
	"wang nian",
	"wang qiu",
	"wang wei",
	"wang xiang",
	"wang yan",
	"wang xing",
	"wang ji",
	"wang sheng",
	"wang ri",
	"wang zu",
	"wei ji",
	"wei wang",
	"wei yan",
	"wei yi",
	"wei bo",
	"wei feng",
	"wei li",
	"wei xiao",
	"wei xing",
	"wei wei",
	"wei ci",
	"wei hai",
	"wei he",
	"wei nan",
	"wei shi",
	"wei wu",
	"wei xian",
	"wei zhong",
	"wei cheng",
	"wei guan",
	"wei jian",
	"wei ju",
	"wei qi",
	"wei zuo",
	"wei fan",
	"wei jin",
	"wei xin",
	"wei du",
	"wei mu",
	"wei zhang",
	"wei kong",
	"wei wo du zun",
	"wei you",
	"wei xi",
	"wei ren",
	"wei bi",
	"wei lie",
	"wei man",
	"wei shu",
	"wei deng",
	"wei sheng",
	"wei zhui",
	"wei zi",
	"wei qu",
	"wei tuo",
	"wei guo",
	"wei suo",
	"wei xie",
	"wei hu",
	"wei sheng yuan",
	"wei bu",
	"wei chang",
	"wei jing",
	"wei mian",
	"wei ran",
	"wei sui",
	"wei zhi",
	"wei bei",
	"wei neng",
	"wei yu",
	"wei dao",
	"wei jue",
	"wei guang",
	"wei han",
	"wei bing",
	"wei ye",
	"wei lan",
	"wei an",
	"wen shi",
	"wen cai",
	"wen du",
	"wen gao",
	"wen ju",
	"wen ke",
	"wen qi",
	"wen shen",
	"wen shu",
	"wen wu",
	"wen xi",
	"wen yi",
	"wen zhi",
	"wen li",
	"wen jian",
	"wen ming",
	"wen ren",
	"wen xun",
	"wen zhang",
	"wen zi",
	"wen he",
	"wen dang",
	"wen an",
	"wen bu",
	"wen ding",
	"wen hao",
	"wen hou",
	"wen hua",
	"wen ji",
	"wen juan",
	"wen lu",
	"wen ti",
	"wo ju",
	"wo pu",
	"wu ji",
	"wu yu",
	"wu zi",
	"wu mie",
	"wu bu",
	"wu chang",
	"wu du",
	"wu fang",
	"wu gu",
	"wu hai",
	"wu hui",
	"wu jia",
	"wu jin",
	"wu lai",
	"wu li",
	"wu liang",
	"wu ming",
	"wu qing",
	"wu shi",
	"wu shu",
	"wu si",
	"wu sun",
	"wu suo bu zhi",
	"wu wei",
	"wu wu",
	"wu xia",
	"wu xian",
	"wu xu",
	"wu ya",
	"wu ye",
	"wu yi",
	"wu you",
	"wu yuan",
	"wu zhi",
	"wu di",
	"wu guan",
	"wu lun",
	"wu xing",
	"wu yin",
	"wu jian",
	"wu jiao",
	"wu shui",
	"wu yan",
	"wu mei",
	"wu ni",
	"wu ran",
	"wu duan",
	"wu fu",
	"wu gong",
	"wu jiang",
	"wu jing",
	"wu qi",
	"wu sheng",
	"wu ru",
	"wu bi",
	"wu chi",
	"wu nong",
	"wu hou",
	"wu liao",
	"wu se",
	"wu tai",
	"wu ti",
	"wu xiang",
	"wu can",
	"wu dao",
	"wu qu",
	"wu ren",
	"wu shang",
	"wu ting",
	"wu xin",
	"wu yong",
	"wu ju",
	"wu ai",
	"wu hua",]

	let X = ["xi hua",
	"xi jing",
	"xi shi",
	"xi yang",
	"xi fu",
	"xi li",
	"xi yan",
	"xi yi",
	"xi fei",
	"xi shou",
	"xi han",
	"xi luo",
	"xi qi",
	"xi shu",
	"xi zhou",
	"xi jian",
	"xi shui",
	"xi bo",
	"xi nao",
	"xi xi",
	"xi xiao",
	"xi you",
	"xi xia",
	"xi wei",
	"xi guan",
	"xi zi",
	"xi mian",
	"xi ji",
	"xi qu",
	"xi yong",
	"xi wen",
	"xi ran",
	"xi shua",
	"xi xue",
	"xi yin",
	"xi yu",
	"xi yuan",
	"xi hao",
	"xi ju",
	"xi lian",
	"xi qian",
	"xi que",
	"xi tang",
	"xi xin",
	"xi yue",
	"xi ci",
	"xi fa",
	"xi wu",
	"xi zhuang",
	"xi nian",
	"xi bao",
	"xi bu",
	"xi cai",
	"xi dian",
	"xi gong",
	"xi jie",
	"xi jiu",
	"xi liu liu",
	"xi mi",
	"xi ni",
	"xi qing",
	"xi rou",
	"xi shuo",
	"xi yao",
	"xi zhang",
	"xi zhi",
	"xi di",
	"xi feng",
	"xia zi",
	"xia yi",
	"xia bai",
	"xia bian",
	"xia chang",
	"xia chu",
	"xia chui",
	"xia fan",
	"xia fang",
	"xia hua",
	"xia ji",
	"xia jia",
	"xia jiang",
	"xia ke",
	"xia pin",
	"xia qi",
	"xia qian",
	"xia qu",
	"xia ren",
	"xia san lan",
	"xia shen",
	"xia shi",
	"xia shou",
	"xia shu",
	"xia shui",
	"xia ta",
	"xia wen",
	"xia xian",
	"xia xiang",
	"xia xie",
	"xia yao",
	"xia ye",
	"xia yu",
	"xia zhi",
	"xia zhou",
	"xia zhu",
	"xia bo",
	"xia bu",
	"xia li",
	"xia ling",
	"xia zhong",
	"xia zhuang",
	"xian he",
	"xian jue",
	"xian qian",
	"xian ren",
	"xian shi",
	"qian sheng",
	"xian xian",
	"xian dao",
	"xian qi",
	"xian bei",
	"xian huo",
	"xian li",
	"xian rou",
	"xian hua",
	"xian tian",
	"xian zhi",
	"xian zi",
	"xian chen",
	"xian liang",
	"xian ming",
	"xian shu",
	"xian zhe",
	"xian cai",
	"xian dan",
	"xian yan",
	"xian jing",
	"xian yuan",
	"xian fan",
	"xian xi",
	"xian yi",
	"xian da",
	"xian de",
	"xian jian",
	"xian ling",
	"xian neng",
	"xian sheng",
	"xian xiao",
	"xian xing",
	"xian xue",
	"xian yao",
	"xian di",
	"xian feng",
	"xian gu",
	"xian ju",
	"xian qiao",
	"xian qing",
	"xian tan",
	"xian zu",
	"xian fu",
	"xian guan",
	"xian jie",
	"xian wei",
	"xian chang",
	"xian cheng",
	"xian chou",
	"xian chu",
	"xian fang",
	"xian hui",
	"xian jin",
	"xian mai",
	"xian xia",
	"xian xiang",
	"xian you",
	"xian lu",
	"xian suo",
	"xian tou",
	"xian du",
	"xian e",
	"xian jia",
	"xian yu",
	"xian ji",
	"xian mei",
	"xian shen",
	"xiang cheng",
	"xiang chi",
	"xiang dang",
	"xiang fan",
	"xiang ji",
	"xiang jian",
	"xiang jiao",
	"xiang ju",
	"xiang lian",
	"xiang lin",
	"xiang qin",
	"xiang ren",
	"xiang shi",
	"xiang shu",
	"xiang si",
	"xiang tong",
	"xiang xiang",
	"xiang yi",
	"xiang ying",
	"xiang yu",
	"xiang yue",
	"xiang zhi",
	"xiang chang",
	"xiang chun",
	"xiang dai",
	"xiang gu",
	"xiang hui",
	"xiang wei",
	"xiang yan",
	"xiang you",
	"xiang zhu",
	"xiang fang",
	"xiang cai",
	"xiang di",
	"xiang li",
	"xiang jin",
	"xiang bei",
	"xiang jie",
	"xiang ming",
	"xiang qing",
	"xiang tan",
	"xiang tu",
	"xiang he",
	"xiang ban",
	"xiang bi",
	"xiang bian",
	"xiang lei",
	"xiang qi",
	"xiang sheng",
	"xiang yin",
	"xiang nian",
	"xiang tou",
	"xiang wang",
	"xiang lai",
	"xiang shang",
	"hang dao",
	"xiang zi",
	"xiang quan",
	"xiang ya",
	"xiang hua",
	"xiang pian",
	"xiang yang",
	"xiang zhang",
	"xue jian",
	"xiao qi",
	"xiao shi",
	"xiao shou",
	"xiao ye",
	"xiao shu",
	"xiao yan",
	"xiao hao",
	"xiao jia",
	"xiao zhang",
	"xiao xiao",
	"xiao han",
	"xiao ban",
	"xiao chou",
	"xiao ci",
	"xiao dao",
	"xiao fei",
	"xiao jian",
	"xiao jiang",
	"xiao jiao",
	"xiao jie",
	"xiao liang",
	"xiao lu",
	"xiao mai",
	"xiao mi",
	"xiao qian",
	"xiao qiao",
	"xiao qu",
	"xiao sheng",
	"xiao ti da zuo",
	"xiao ting",
	"xiao tou",
	"xiao tui",
	"xiao xi",
	"xiao xie",
	"xiao xing",
	"xiao xue",
	"xiao yu",
	"xiao zhu",
	"xiao zhuan",
	"xiao zi",
	"xiao zu",
	"xiao chang",
	"xiao yue",
	"xiao fu",
	"xiao jing",
	"xiao nv",
	"xiao xin",
	"xiao yi",
	"xiao fang",
	"xiao guo",
	"xiao li",
	"xiao ming",
	"xiao ying",
	"xiao yong",
	"xiao zhong",
	"jiao gai",
	"xiao gui",
	"xiao hua",
	"xiao hui",
	"xiao ji",
	"xiao kan",
	"xiao she",
	"xiao you",
	"xiao zhi",
	"xiao ju",
	"xiao lian",
	"xiao na",
	"xiao rong",
	"xiao wo",
	"xie zi",
	"xie ban",
	"xie li",
	"xie hu",
	"xie jiao",
	"xie qi",
	"xie tong",
	"xie lu",
	"xie po",
	"xie xian",
	"xie tiao",
	"xie dai",
	"xie shou",
	"xie qu",
	"xie mian",
	"xie yang",
	"xie jing",
	"xie sheng",
	"xie shi",
	"xie yi",
	"xie zhao",
	"xie zuo",
	"xie lou",
	"xie du",
	"xie huo",
	"xie zhi",
	"xie zhuang",
	"xie ding",
	"xin di",
	"xin fu",
	"xin gan",
	"xin ji",
	"xin jian",
	"xin jing",
	"xin li",
	"xin ling",
	"xin lv",
	"xin shi",
	"xin suan",
	"xin xu",
	"xin yi",
	"xin zhi",
	"xin zi",
	"xin mu",
	"xin shang",
	"xin xi",
	"xin xian",
	"xin xing",
	"xin bing",
	"xin chao",
	"xin ci",
	"xin fang",
	"xin jiao",
	"xin jin",
	"xin kuan",
	"xin qi",
	"xin qiao",
	"xin qu",
	"xin ren",
	"xin sheng",
	"xin shu",
	"xin wen",
	"xin xue",
	"xin ying",
	"xin yue",
	"xin zheng",
	"xin feng",
	"xin xiang",
	"xin han",
	"xin kou",
	"xin nian",
	"xin shou",
	"xin tiao",
	"xin yu",
	"xing shi",
	"xing wang",
	"xing ji",
	"xing qi",
	"xing xiu",
	"xing ti",
	"xing xiang",
	"xing xing",
	"xing fa",
	"xing gong",
	"xing hao",
	"xing jing",
	"xing li",
	"xing lv",
	"xing qiang",
	"xing shan",
	"hang shi",
	"xing shu",
	"xing tou",
	"xing wei",
	"hang wu",
	"xing zhi",
	"xing zhuang",
	"xing cheng",
	"xing sheng",
	"xing mu",
	"xing wu",
	"xing he",
	"xing hong",
	"xing ren",
	"xing zi",
	"xing chen",
	"xing hui",
	"xing xi",
	"xing yun",
	"xing bing",
	"xing ling",
	"xing ming",
	"xing zheng",
	"xiong qi",
	"xiong sha",
	"xiong di",
	"xiong xian",
	"xiong xiang",
	"xiong zhang",
	"xiong zhao",
	"xiong feng",
	"xiong ju",
	"xiong shi",
	"xiong wei",
	"xiong xin",
	"xiong bao",
	"xiong xiong",
	"xiu gai",
	"xiu jian",
	"xiu mian",
	"xiu qi",
	"xiu shi",
	"xiu shu",
	"xiu xian",
	"xiu yang",
	"xiu zheng",
	"xiu zhi",
	"xiu zhu",
	"xiu yu",
	"xiu hui",
	"xiu li",
	"xiu mei",
	"xiu se",
	"xiu xiang",
	"xiu ban",
	"xu shi",
	"xu yan",
	"xu zhi",
	"xu zi",
	"xu sheng",
	"xu yao",
	"xu huan",
	"xu hao",
	"xu mu",
	"xu shu",
	"xu jiu",
	"chu lei",
	"chu qin",
	"xu lun",
	"xu jia",
	"xu qu",
	"xu xian",
	"xu xu",
	"xu yu",
	"xu fa",
	"xu ji",
	"xu yang",
	"xuan shi",
	"xuan jiao",
	"xuan xiao",
	"xuan he",
	"xuan xiang",
	"xuan ji",
	"xuan rao",
	"xuan ti",
	"xuan wu",
	"xuan chang",
	"xuan diao",
	"xuan du",
	"xuan qu",
	"xuan shou",
	"xuan xiu",
	"xuan zhi",
	"xuan zhong",
	"xuan mu",
	"xuan ran",
	"xue tou",
	"xue bu",
	"xue fa",
	"xue li",
	"xue she",
	"xue shi",
	"xue wei",
	"xue xi",
	"xue yuan",
	"xue zhi",
	"xue zi",
	"xue bao",
	"xue feng",
	"xue li hong",
	"xue jia",
	"xue qiu",
	"xue ren",
	"xue xian",
	"xue ye",
	"xue beng",
	"xue hai",
	"xue hen",
	"xue ji",
	"xue liang",
	"xue qi",
	"xue qing",
	"xue shu",
	"xue shui",
	"xue tang",
	"xue tong",
	"xue xing",
	"xue yi",
	"xun ran",
	"xun ji",
	"xun si",
	"xun cha",
	"xun fang",
	"xun feng",
	"xun jian",
	"xun shi",
	"xun ye",
	"xun shou",
	"xun wen",
	"xun huan",
	"xun li",
	"xun sheng",
	"xun hua",
	"xun hui",
	"xun jie",
	"xun xi",
	"xun qing",
	"xun wei",
	"xun dao",]

	let Y = ["ya jing",
	"ya che",
	"ya fu",
	"ya yun",
	"ya li",
	"ya gang",
	"ya yi",
	"ya yin",
	"ya zi",
	"ya ke",
	"ya chang",
	"ya ju",
	"ya guan",
	"ya qi",
	"ya yan",
	"ya zhi",
	"ya yu",
	"ya zhou",
	"yan qi",
	"yan mo",
	"yan zhi",
	"yan ge",
	"yan hou",
	"yan wu",
	"yan jin",
	"yan ming",
	"yan shi",
	"yan shou",
	"yan xing",
	"yan zheng",
	"yan li",
	"yan ci",
	"yan he",
	"yan huan",
	"yan qing",
	"yan yu",
	"yan zhong",
	"yan dong",
	"yan hua",
	"yan yan",
	"yan jiang",
	"yan lu",
	"yan tu",
	"yan di",
	"yan xia",
	"yan jiu",
	"yan jiu yuan",
	"yan xi",
	"yan chang",
	"yan chi",
	"yan suan",
	"yan tan",
	"yan ye",
	"yan mian",
	"yan se",
	"yan ran",
	"yan bi",
	"yan hu",
	"yan bo",
	"yan dai",
	"yan fu",
	"yan gao",
	"yan hong",
	"yan jian",
	"yan jiao",
	"yan jie",
	"yan jing",
	"yan ku",
	"yan kuang",
	"yan lei",
	"yan mei",
	"yan mu",
	"yan qian",
	"yan re",
	"yan shen",
	"yan sheng",
	"yan shu",
	"yan xian",
	"yan ying",
	"yan yun",
	"yan zhu",
	"yan bian",
	"yan chu",
	"yan ji",
	"yan ju",
	"yan lian",
	"yan shuo",
	"yan yi",
	"yan fan",
	"yan zhan",
	"yan han",
	"yan hui",
	"yan ke",
	"yan yin",
	"yan wen",
	"yan yang",
	"yan zhuang",
	"yan cha",
	"yan fang",
	"yan guan",
	"yan guang",
	"yan huo",
	"yan kan",
	"yan shang",
	"yan xue",
	"yan zhao",
	"yan zi",
	"yan mai",
	"yan wo",
	"yan pin",
	"yang qi",
	"yang gao",
	"yang ji",
	"yang shou",
	"yang wei",
	"yang cheng",
	"yang yan",
	"yang chang",
	"yang hua",
	"yang huo",
	"yang liu",
	"yang shi",
	"yang wen",
	"yang hang",
	"yang zhuang",
	"yang bo",
	"yang guang",
	"yang mian",
	"yang mu",
	"yang tian",
	"yang bing",
	"yang fu",
	"yang ren",
	"yang xing",
	"yang yu",
	"yang zi",
	"yang yang",
	"yang shu",
	"yao wu",
	"yao yan",
	"yao dai",
	"yao zi",
	"yao chuan",
	"yao dong",
	"yao ye",
	"yao yi",
	"yao wang",
	"yao zhi",
	"yao ding",
	"yao he",
	"yao bu",
	"yao dian",
	"yao fang",
	"yao gong",
	"yao ji",
	"yao li",
	"yao mian",
	"yao shi",
	"yao wei",
	"yao xiang",
	"yao chong",
	"yao dao",
	"yao fan",
	"yao hai",
	"yao jian",
	"yao jin",
	"yao xie",
	"yao yuan",
	"yao zhe",
	"yao mu",
	"ye shi",
	"ye zhi",
	"ye zhu",
	"ye ji",
	"ye wu",
	"ye yu",
	"ye ya",
	"ye zi",
	"ye ma",
	"ye mian",
	"ye yan",
	"ye ban",
	"ye can",
	"ye hua",
	"ye jing",
	"ye qu",
	"ye su",
	"ye xiao",
	"ye xing",
	"ye ying",
	"ye zhan",
	"ye jian",
	"ye mao",
	"yi ban",
	"yi dai",
	"yi gai",
	"yi ji",
	"yi jing",
	"yi qi",
	"yi shi",
	"yi tong",
	"yi xin",
	"yi zhi",
	"yi ren",
	"yi guan",
	"yi jiao",
	"yi kou",
	"yi xiang",
	"yi dao",
	"yi fang",
	"yi liao",
	"yi sheng",
	"yi shu",
	"yi wu",
	"yi fu",
	"yi ju",
	"yi lian",
	"yi shun",
	"yi wei",
	"yi yi",
	"yi zhao",
	"yi li",
	"yi zhang",
	"yi ran",
	"yi biao",
	"yi xian",
	"yi ru",
	"yi zai",
	"yi cun",
	"yi du",
	"yi gu",
	"yi hai",
	"yi huan",
	"yi liu",
	"yi rong",
	"yi ti",
	"yi yan",
	"yi yuan",
	"yi zhu",
	"yi an",
	"yi bing",
	"yi dou",
	"yi fan",
	"yi huo",
	"yi lv",
	"yi wen",
	"yi zhen",
	"yi zu",
	"yi gan",
	"yi que",
	"yi wang",
	"yi bian",
	"yi ci lei tui",
	"yi ci",
	"yi dong",
	"yi jin",
	"yi lai",
	"yi mian",
	"yi nan",
	"yi shang",
	"yi xi",
	"yi xia",
	"yi zhi yu",
	"yi hou",
	"yi kao",
	"yi dian",
	"yi zi",
	"yi gong",
	"yi mu",
	"yi xue",
	"yi yong",
	"yi zheng ci yan",
	"yi zhong",
	"yi ding",
	"yi gou",
	"yi jia",
	"yi zheng",
	"yi bang",
	"yi cai",
	"yi ri",
	"yi xing",
	"yi yang",
	"yi yu",
	"yi ming",
	"yi chu",
	"yi gao",
	"yi ma",
	"yi zhe",
	"yi zuo",
	"yi di",
	"yi shou",
	"yi qing",
	"yi qu",
	"yi fa",
	"yi hui",
	"yi jian",
	"yi nian",
	"yi si",
	"yi tai",
	"yi tu",
	"yi wai",
	"yi yun",
	"yi mei",
	"yi ye",
	"yi mi",
	"yi ce",
	"yi duan",
	"yi zao",
	"yin shi zhi yi",
	"yin gong",
	"yin si",
	"yin yu",
	"yin yuan",
	"yin bi",
	"yin liang",
	"yin jie",
	"yin su",
	"yin xi",
	"yin xiang",
	"yin xu",
	"yin xun",
	"yin yi",
	"yin yun",
	"yin zhi",
	"yin fu",
	"yin jian",
	"yin qin",
	"yin shi",
	"yin yin",
	"yin hui",
	"yin wei",
	"yin er",
	"yin hun",
	"yin jiang",
	"yin ping",
	"yin se",
	"yin xing",
	"yin yang",
	"yin zi",
	"yin dao",
	"yin du",
	"yin fa",
	"yin hang",
	"yin hao",
	"yin jing",
	"yin li",
	"yin qi",
	"yin qiao",
	"yin ren zhu mu",
	"yin shu",
	"yin wen",
	"yin xian",
	"yin xin",
	"yin yan",
	"yin yong",
	"yin you",
	"yin jiu",
	"yin ji",
	"yin qing",
	"yin shen",
	"yin tui",
	"yin yue",
	"yin zhong",
	"yin hen",
	"yin hua",
	"yin ni",
	"yin ran",
	"yin zhang",
	"yin zheng",
	"ying ji",
	"ying jie",
	"ying sheng",
	"ying shi",
	"ying yun",
	"ying zhao",
	"ying li",
	"ying ming",
	"ying mu",
	"ying yong",
	"ying zi",
	"ying su",
	"ying wu",
	"ying he",
	"ying zhan",
	"ying men",
	"ying ying",
	"ying yu",
	"ying guang",
	"ying di",
	"ying qu",
	"ying yang",
	"ying tou",
	"ying de",
	"ying hou",
	"ying ping",
	"ying xiang",
	"ying she",
	"ying bi",
	"ying cheng",
	"ying gong",
	"ying hua",
	"ying jian",
	"ying mian",
	"ying pan",
	"ying pin",
	"ying qi",
	"ying xing",
	"ying yao",
	"ying zhang",
	"yong ren",
	"yong se",
	"yong lu",
	"yong dao",
	"yong yi",
	"yong shi",
	"yong cai",
	"yong chang",
	"yong du",
	"yong gong",
	"yong hu",
	"yong ji",
	"yong jin",
	"yong ju",
	"yong li",
	"yong qian",
	"yong wu",
	"yong yu",
	"you sheng",
	"you yu",
	"you hui",
	"you jing",
	"you ju",
	"you ling",
	"you mei",
	"you men",
	"you si",
	"you ya",
	"you yuan",
	"you xian",
	"you you",
	"you shen",
	"you wei",
	"you yi",
	"you dai",
	"you dian",
	"you ji",
	"you shi",
	"you xiang",
	"you zi",
	"you cai",
	"you chuan",
	"you deng",
	"you gou",
	"you guan",
	"you hua",
	"you ku",
	"you liang",
	"you lu",
	"you lv",
	"you lun",
	"you mo",
	"you ni",
	"you pin",
	"you qi",
	"you ran",
	"you tong",
	"you wu",
	"you xing",
	"you zha",
	"you zhan",
	"you zhi",
	"you dang",
	"you guang",
	"you li",
	"you lie",
	"you mu",
	"you shui",
	"you ting",
	"you wan",
	"you yong",
	"you hao",
	"you qing",
	"you ren",
	"you ai",
	"you bian",
	"you bing",
	"you chang",
	"you cheng",
	"you de",
	"you di",
	"you fang",
	"you fen",
	"you jin",
	"you jiu",
	"you lai",
	"you ming",
	"you pan",
	"you qu",
	"you ru",
	"you xi",
	"you xin",
	"you zhong",
	"you zhe",
	"you hei",
	"you ce",
	"you shou",
	"you lin",
	"you nian",
	"you ruo",
	"you xiao",
	"you chu",
	"you bu",
	"you er",
	"you gong",
	"you jian",
	"you yin",
	"yu hui",
	"yu ji",
	"yu jin",
	"yu li",
	"yu sheng",
	"yu wei",
	"yu xia",
	"yu chi",
	"yu du",
	"yu lei",
	"yu yue",
	"yu fu",
	"yu gang",
	"yu lun",
	"yu qu",
	"yu xun",
	"yu chang",
	"yu min",
	"yu ren",
	"yu wang",
	"yu zhong",
	"yu qian",
	"yu jia",
	"yu qi",
	"yu zhou",
	"yu hua",
	"yu yi",
	"yu ju",
	"yu liang",
	"yu lin",
	"yu lu",
	"yu mao",
	"yu pi",
	"yu qing",
	"yu shi",
	"yu shui",
	"yu xie",
	"yu xue",
	"yu yun",
	"yu ci",
	"yu jing",
	"yu se",
	"yu wen",
	"yu yan",
	"yu yin",
	"yu bo",
	"yu dai",
	"yu diao",
	"yu ti",
	"yu tu",
	"yu ye",
	"yu zhuo",
	"yu er",
	"yu miao",
	"yu ying",
	"yu fen",
	"yu re",
	"yu yu",
	"yu bu",
	"yu ding",
	"yu gan",
	"yu gou",
	"yu gu",
	"yu jian",
	"yu liao",
	"yu liu",
	"yu shou",
	"yu xi",
	"yu xing",
	"yu zhao",
	"yu zheng",
	"yu zhi",
	"yu huo",
	"yu nian",
	"yu di",
	"yu wu",
	"yu yuan",
	"yu xian",
	"yu fa",
	"yu he",
	"yuan qu",
	"yuan an",
	"yuan di",
	"yuan ding",
	"yuan gao",
	"yuan jia",
	"yuan jian",
	"yuan liang",
	"yuan shen",
	"yuan wei",
	"yuan xing",
	"yuan yang",
	"yuan ye",
	"yuan yi",
	"yuan yin",
	"yuan you",
	"yuan zhi",
	"yuan zhu",
	"yuan zhuang",
	"yuan zi",
	"yuan chang",
	"yuan hua",
	"yuan ji",
	"yuan ling",
	"yuan shi",
	"yuan tong",
	"yuan li",
	"yuan shou",
	"yuan qi",
	"yuan yu",
	"yuan quan",
	"yuan yuan",
	"yuan ren",
	"yuan fang",
	"yuan gu",
	"yuan wang",
	"yuan xiao",
	"yuan zu",
	"yuan fen",
	"yuan yan",
	"yuan xin",
	"yue ji",
	"yue mo",
	"yue shu",
	"yue tan",
	"yue gong",
	"yue li",
	"yue shi",
	"yue zhong",
	"yue fu",
	"yue zhang",
	"yue mu",
	"yue bing",
	"yue du",
	"yue ju",
	"yue dong",
	"yue fa",
	"yue gui",
	"yue jia",
	"yue jing",
	"yue wei",
	"yue ye",
	"yun ji",
	"yun qi",
	"yun yu",
	"yun liang",
	"yun shu",
	"yun xiao",
	"yun xing",
	"yun dao",
	"yun mu",
	"yun shi",
	"yun dou",
	"yu tang",
	"yu tie",
	"yun han",
	"yun xu",
	"yun yi",]

	let Z = ["za fei",
	"za huo",
	"za ji",
	"za ju",
	"za shi",
	"za wu",
	"za zhi",
	"za sui",
	"zai yang",
	"zai ke",
	"zai zhong",
	"zai qu",
	"zai zhi",
	"zai bian",
	"zai du",
	"zai jia",
	"zai jian",
	"zai shi",
	"zai xian",
	"zai ye",
	"zai yi",
	"zai yu",
	"za jia",
	"zan yu",
	"zan zhu",
	"zang wu",
	"zang li",
	"zang yi",
	"zao dao",
	"zao qi",
	"zao shi",
	"zao zao",
	"zao gao",
	"zao shu",
	"zao zi",
	"zao jian",
	"zao tang",
	"zao fan",
	"zao hua",
	"zao jia",
	"zao ju",
	"zao yi",
	"ze you",
	"zeng jian",
	"zeng zhi",
	"zeng liang",
	"zeng zi",
	"zeng yu",
	"zha zi",
	"zha ji",
	"zha dao",
	"zha yan",
	"zha hu",
	"zha shi",
	"zha qu",
	"zhai di",
	"zhai ji",
	"zhai quan",
	"zhai zhu",
	"zhai zi",
	"zhan wang",
	"zhan shou",
	"zhan shi",
	"zhan di",
	"zhan li",
	"zhan xian",
	"zhan bao",
	"zhan dou",
	"zhan guo",
	"zhan huo",
	"zhan ji",
	"zhan ju",
	"zhan qi",
	"zhan qu",
	"zhan shu",
	"zhan you",
	"zhan dao",
	"zhan fang",
	"zhan chang",
	"zhan tai",
	"zhan kai",
	"zhan lu",
	"zhan lan",
	"zhang zi",
	"zhang mu",
	"zhang luo",
	"zhang shi",
	"zhang guan",
	"zhang zui",
	"zhang fu",
	"zhang ren",
	"zhang dan",
	"zhang fang",
	"zhang li",
	"zhao gong",
	"zhao shou",
	"zhao shi",
	"zhao ling",
	"zhao qi",
	"zhao hui",
	"zhao ji",
	"zhao tou",
	"zhao shu",
	"zhao ban",
	"zhao fu",
	"zhao gu",
	"zhao hu",
	"zhao li",
	"zhao pai",
	"zhao xiang",
	"zhao yang",
	"zhao yao",
	"zhao ying",
	"zhao zhang",
	"zhao zhi",
	"zhao huo",
	"zhe fu",
	"zhe guang",
	"zhe ju",
	"zhe zhou",
	"zhe zi",
	"zhe li",
	"zhe yang",
	"zhen jie",
	"zhen cha",
	"zhen ji",
	"zhen xi",
	"zhen kong",
	"zhen pin",
	"zhen shi",
	"zhen yi",
	"zhen zhi",
	"zhen zhu",
	"zhen ban",
	"zhen jiu",
	"zhen zi",
	"zhen yan",
	"zhen mu",
	"zhen tou",
	"zhen di",
	"zhen fa",
	"zhen jiao",
	"zhen xian",
	"zhen tong",
	"zhen dang",
	"zhen dong",
	"zhen jing",
	"zhen qing",
	"zhen she",
	"zhen xiang",
	"zhen zai",
	"zhen zhong",
	"zheng qiang",
	"zheng fa",
	"zheng gou",
	"zheng xiang",
	"zheng zhan",
	"zheng zhao",
	"zheng chong",
	"zheng yan",
	"zheng zheng",
	"zheng bing",
	"zheng jiao",
	"zheng qi",
	"zheng bian",
	"zheng chi",
	"zheng di",
	"zheng fu",
	"zheng ji",
	"zheng liu",
	"zheng rong",
	"zheng su",
	"zheng tao",
	"zheng xun",
	"zheng yi",
	"zheng zhi",
	"zheng ban",
	"zheng dang",
	"zheng dian",
	"zheng fang",
	"zheng gao",
	"zheng gui",
	"zheng guo",
	"zheng jing",
	"zheng li",
	"zheng lun",
	"zheng ming",
	"zheng pai",
	"zheng pin",
	"zheng shi",
	"zheng shou",
	"zheng shu",
	"zheng ti",
	"zheng tu",
	"zheng wen",
	"zheng wu",
	"zheng xiong",
	"zheng ye",
	"zheng yin",
	"zheng yue",
	"zheng hun",
	"zheng ju",
	"zheng ren",
	"zheng zhong",
	"zheng feng",
	"zheng gong",
	"zheng jian",
	"zheng jie",
	"zheng ke",
	"zheng qu",
	"zheng quan",
	"zheng shen",
	"zheng yao",
	"zheng hou",
	"zheng zhuang",
	"zhi ji",
	"zhi chu",
	"zhi dian",
	"zhi liu",
	"zhi qian",
	"zhi qu",
	"zhi cha",
	"zhi ye",
	"zhi zi",
	"zhi jiao",
	"zhi ming",
	"zhi qing",
	"zhi bu",
	"zhi wu",
	"zhi jie",
	"zhi you",
	"zhi zhu",
	"zhi niu",
	"zhi bian",
	"zhi dao",
	"zhi fa",
	"zhi fa fan fa",
	"zhi wei",
	"zhi wei hui",
	"zhi xing",
	"zhi yi",
	"zhi zhao",
	"zhi zhuo",
	"zhi nv",
	"zhi bi",
	"zhi bo",
	"zhi chi",
	"zhi gan",
	"zhi jue",
	"zhi li",
	"zhi pai",
	"zhi shi",
	"zhi shu",
	"zhi xi",
	"zhi xia",
	"zhi xian",
	"zhi xiao",
	"zhi qin",
	"zhi cheng",
	"zhi da",
	"zhi gao",
	"zhi shou",
	"zhi yuan",
	"zhi zhang",
	"zhi mian",
	"zhi jing",
	"zhi tong",
	"zhi dang",
	"zhi de",
	"zhi guan",
	"zhi yin",
	"zhi yao",
	"zhi ban",
	"zhi jin",
	"zhi tiao",
	"zhi yan",
	"zhi gu",
	"zhi hui",
	"zhi jia",
	"zhi tou",
	"zhi xiang",
	"zhi ze",
	"zhi zheng",
	"zhi bao",
	"zhi hao",
	"zhi shang",
	"zhi shen",
	"zhi yu",
	"zhi ai",
	"zhi bei",
	"zhi biao",
	"zhi ding",
	"zhi fu",
	"zhi jian",
	"zhi leng",
	"zhi pian",
	"zhi pin",
	"zhi sheng",
	"zhi zao",
	"zhi zhi",
	"zhi zhong",
	"zhi ben",
	"zhi liao",
	"zhi shui",
	"zhi xue",
	"zhi kao",
	"zhi re",
	"zhi di",
	"zhi dui",
	"zhi wen",
	"zhi bing",
	"zhi ci",
	"zhi si",
	"zhi xie",
	"zhi neng",
	"zhi hou",
	"zhi qi",
	"zhi fang",
	"zhi huan",
	"zhi xin",
	"zhong biao",
	"zhong duan",
	"zhong fan",
	"zhong feng",
	"zhong guo hua",
	"zhong ji",
	"zhong jian",
	"zhong jiang",
	"zhong qi",
	"zhong shi",
	"zhong shu",
	"zhong wei",
	"zhong xing",
	"zhong xue",
	"zhong yi",
	"zhong yong",
	"zhong zhi",
	"zhong zhuan",
	"zhong zi",
	"zhong cheng",
	"zhong gu",
	"zhong xiao",
	"zhong xin",
	"zhong yu",
	"zhong chang",
	"zhong dian",
	"zhong jie",
	"zhong jiu",
	"zhong nian",
	"zhong shen",
	"zhong xi",
	"zhong ye",
	"zhong qing",
	"zhong liu",
	"zhong dan",
	"zhong ren",
	"zhong tian",
	"zhong yang",
	"zhong cai",
	"zhong dong",
	"zhong qiu",
	"zhong sheng",
	"zhong yi yuan",
	"zhong ban",
	"zhong bing",
	"zhong can",
	"zhong chen",
	"zhong da",
	"zhong di",
	"zhong du",
	"chong fan",
	"zhong fu",
	"chong fu",
	"zhong he",
	"zhong ju",
	"zhong li",
	"zhong liang",
	"zhong pan",
	"zhong shang",
	"chong shen",
	"zhong shui",
	"zhong ting",
	"zhong tou",
	"zhong wen",
	"zhong xian",
	"chong xiao",
	"chong xin",
	"chong xing",
	"chong yan",
	"zhong yan",
	"zhong yao",
	"chong yi",
	"zhong yin",
	"chong yin",
	"chong ying",
	"zhong you",
	"zhong zai",
	"zhong zhen",
	"chong zu",
	"zhou bian",
	"zhou chang",
	"zhou ji",
	"zhou ye",
	"zhou zhe",
	"zhou qi",
	"zhou yu",
	"zhu sha",
	"zhu lian",
	"zhu ru",
	"zhu zi",
	"zhu lan",
	"zhu wen",
	"zhu gan",
	"zhu ji",
	"zhu li",
	"zhu pai",
	"zhu qi",
	"zhu sun",
	"zhu hua",
	"zhu bu",
	"zhu ge",
	"zhu jian",
	"zhu ju",
	"zhu lu",
	"zhu xiang",
	"zhu yi",
	"zhu ban",
	"zhu bi",
	"zhu bian",
	"zhu chang",
	"zhu ci",
	"zhu dao",
	"zhu diao",
	"zhu fa",
	"zhu feng",
	"zhu gong",
	"zhu guan",
	"zhu jiang",
	"zhu ke",
	"zhu liu",
	"zhu lou",
	"zhu quan",
	"zhu ren",
	"zhu shi",
	"zhu ti",
	"zhu xi",
	"zhu ye",
	"zhu ying",
	"zhu yu",
	"zhu zai",
	"zhu zhi",
	"zhu fu",
	"zhu wang",
	"zhu hou",
	"zhu chi",
	"zhu chu",
	"zhu hu",
	"zhu su",
	"zhu xiao",
	"zhu chan",
	"zhu zhang",
	"zhu jiao",
	"zhu shou",
	"zhu wei",
	"zhu xing",
	"zhu yan",
	"zhu zhan",
	"zhu ma",
	"zhu jie",
	"zhu mu",
	"zhu she",
	"zhu yin",
	"zhu liang",
	"zhu di",
	"zhu fang",
	"zhu jun",
	"zhu yuan",
	"zhu ming",
	"zhu shu",
	"zhu cheng",
	"zhuan chang",
	"zhuan cheng",
	"zhuan gong",
	"zhuan ji",
	"zhuan ren",
	"zhuan ye",
	"zhuan zhi",
	"zhuan zhu",
	"zhuan shi",
	"zhuan che",
	"zhuan diao",
	"zhuan dong",
	"zhuan gao",
	"zhuan gui",
	"zhuan jia",
	"zhuan jiao",
	"zhuan lu",
	"zhuan mai",
	"zhuan men",
	"zhuan nian",
	"zhuan quan",
	"zhuan shu",
	"zhuan ti",
	"zhuan xiang",
	"zhuan yi",
	"zhuan yin",
	"zhuan you",
	"zhuan huan",
	"zhuan yuan",
	"zhuan zheng",
	"zhuan qu",
	"zhuan tou",
	"zhuan xie",
	"zhuan ke",
	"zhuan wen",
	"zhuan zi",
	"zhuang jia",
	"zhuang yuan",
	"zhuang zi",
	"zhuang lian",
	"zhuang shi",
	"zhuang xiang",
	"zhuang ding",
	"zhuang men mian",
	"zhuang zhi",
	"zhuang yu",
	"zhuang che",
	"zhuang ji",
	"zhuang jian",
	"zhuang zhen",
	"zhuang zhong",
	"zhui bu",
	"zhui ji",
	"zhui jiao",
	"zhui su",
	"zhui hui",
	"zhui zi",
	"zhui shu",
	"zhui xu",
	"zhun shi",
	"zhuo jian",
	"zhuo shi",
	"zhuo li",
	"zhao liang",
	"zhuo mo",
	"zhuo yi",
	"zhuo zhuang",
	"zhuo zhuo",
	"zhuo zi",
	"zi cai",
	"zi li",
	"zi xun",
	"zi zhu",
	"zi sheng",
	"zi shi",
	"zi di",
	"zi fang",
	"zi ji",
	"zi xi",
	"zi zhi",
	"zi se",
	"zi sha",
	"zi wei",
	"zi ju",
	"zi mian",
	"zi mu",
	"zi yang",
	"zi yin",
	"zi bao",
	"zi bei",
	"zi bian",
	"zi can",
	"zi chan",
	"zi cheng",
	"zi da",
	"zi fei",
	"zi feng",
	"zi fu",
	"zi gong",
	"zi hao",
	"zi hui",
	"zi jian",
	"zi jin",
	"zi jing",
	"zi jiu",
	"zi jue",
	"zi liu",
	"zi man",
	"zi qiang",
	"zi ran",
	"zi ru",
	"zi shen",
	"zi shu",
	"zi si",
	"zi wen",
	"zi xiao",
	"zi xin",
	"zi xing",
	"zi xu",
	"zi yi",
	"zi you",
	"zi yu",
	"zi yuan",
	"zi zai",
	"zi zhen",
	"zi zhong",
	"zi zhuan",
	"zong shi",
	"zong shu",
	"zong mao",
	"zong gong",
	"zong guan",
	"zong he",
	"zong ji",
	"zong ze",
	"zong zhang",
	"zong zhi",
	"zong dui",
	"zong lan",
	"zong lun",
	"zong mu",
	"zong shen",
	"zou bi",
	"zou shi",
	"zu jie",
	"zu jin",
	"zu yue",
	"zu zi",
	"zu e",
	"zu ji",
	"zu zhi",
	"zu ge",
	"zu jian",
	"zu shi",
	"zu ye",
	"zui jin",
	"zui kuai",
	"zui yan",
	"zuo fa",
	"zuo jia",
	"zuo liao",
	"zuo wei",
	"zuo ye",
	"zuo yi",
	"zuo yong",
	"zuo zheng",
	"zuo ban",
	"zuo da",
	"zuo gu",
	"zuo hua",
	"zuo jian",
	"zuo shi",
	"zuo shou",
	"zuo tan",
	"zuo xi",
	"zuo xiang",
	"zuo can",
	"zuo shu",
	"zuo ci",
	"zuo zi",
	"zuo gong",
	"zuo ke",
	"zuo mei",
	"zuo sheng",
	"zuo zhu",]
}