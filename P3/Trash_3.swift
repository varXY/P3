//
//  Trash_3.swift
//  P3
//
//  Created by 文川术 on 2/12/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


class Trash_3 {

	let P = ["pa sheng",
	"pa shi",
	"pai ban",
	"pai bi",
	"pai dang",
	"pai xi",
	"pai zi",
	"pai fang",
	"pai hao",
	"pai ju",
	"pai wei",
	"pai zhao",
	"pai dui",
	"pai fa",
	"pai qian",
	"pai tou",
	"pan huo",
	"pan fei",
	"pan li",
	"pan tao",
	"pao sa",
	"pao chu",
	"pao shou",
	"pao zhi",
	"pao zi",
	"pao che",
	"pao guang",
	"pao fan",
	"pao tang",
	"pei du",
	"pei song",
	"pei dai",
	"pei fu",
	"pei shi",
	"pei dian",
	"pei fang",
	"pei ji",
	"pei jian",
	"pei zhi",
	"pen guan",
	"pen qi",
	"pen tu",
	"pen qiang",
	"peng zi",
	"peng bei",
	"peng sha",
	"peng ji",
	"pi bu",
	"pi jian",
	"pi yue",
	"pi dian",
	"pi fa",
	"pi fu",
	"pi jia",
	"pi jin",
	"pi mao",
	"pi mian",
	"pi shi",
	"pi tiao",
	"pi xiang",
	"pi zhi",
	"pi zi",
	"pi pa",
	"pi hao",
	"pi xing",
	"pi yu",
	"pian er",
	"pian fang",
	"pian ji",
	"pian ke",
	"pian shi",
	"pian tan",
	"pian xin",
	"pian pian",
	"pian ti",
	"pian xian",
	"pian zi",
	"piao fu",
	"piao ran",
	"piao yi",
	"piao you",
	"pin fu",
	"pin du",
	"pin fa",
	"pin ji",
	"pin ming",
	"pin wei",
	"pin xing",
	"pin mu",
	"pin li",
	"ping di",
	"ping fan",
	"ping fang",
	"ping fu",
	"ping shi",
	"ping tan",
	"ping wen",
	"ping xin",
	"ping yi",
	"ping zheng",
	"ping ding",
	"ping fen",
	"ping jia",
	"ping ju",
	"ping pan",
	"ping shu",
	"ping wei",
	"ping xi",
	"ping yue",
	"ping dan",
	"ping jie",
	"ping bi",
	"bing chu",
	"bing tui",
	"ping zhang",
	"ping jing",
	"ping zhuang",
	"po fei",
	"po jie",
	"po luo",
	"po xiang",
	"po li",
	"pu da",
	"pu teng",
	"pu chen",
	"pu lu",
	"pu mian",
	"pu zi",
	"pu bao",
	"pu shan",
	"pu su",
	"pu tong",]

	let Q = ["qi qie",
	"qi xi",
	"qi qi",
	"qi zhong",
	"qi man",
	"qi qiao",
	"qi ji",
	"qi sheng",
	"qi jian",
	"qi shi",
	"qi cai",
	"qi jue",
	"qi li",
	"qi wen",
	"qi xiao",
	"qi yi",
	"qi yu",
	"qi lu",
	"qi fu",
	"qi pan",
	"qi wang",
	"qi dai",
	"qi chang",
	"qi qu",
	"qi bing",
	"qi feng",
	"qi jing",
	"qi shu",
	"qi ju",
	"qi mi",
	"qi shou",
	"qi yuan",
	"qi zi",
	"qi ren",
	"qi zhi",
	"qi xiang",
	"qi qiu",
	"qi guan",
	"qi hua",
	"qi tu",
	"qi bu",
	"qi gan",
	"qi cheng",
	"qi di",
	"qi an",
	"qi cao",
	"qi chu",
	"qi chuang",
	"qi diao",
	"qi fei",
	"qi hang",
	"qi hong",
	"qi huo",
	"qi jia",
	"qi jiang",
	"qi ling",
	"qi pao",
	"qi shen",
	"qi su",
	"qi wu",
	"qi xian",
	"qi xing",
	"qi ye",
	"qi yong",
	"qi zheng",
	"qi dian",
	"qi dong",
	"qi duan",
	"qi fa",
	"qi fen",
	"qi gai",
	"qi gong",
	"qi guan yan",
	"qi han",
	"qi hou",
	"qi kou",
	"qi liang",
	"qi liu",
	"qi men",
	"qi pai",
	"qi qiang",
	"qi se",
	"qi tian",
	"qi wei",
	"qi xu",
	"qi ya",
	"qi yan",
	"qi yun",
	"qi jin",
	"qi quan",
	"qi she",
	"qi xue",
	"qi chuan",
	"qi chui",
	"qi lun ji",
	"qi you",
	"qi dan",
	"qi shui",
	"qi yue",
	"qian jin",
	"qian xi",
	"qian qiu",
	"qian yin",
	"qian zi",
	"qian ci",
	"qian he",
	"qian dan",
	"qian bei",
	"qian bi",
	"qian cheng",
	"qian dao",
	"qian fang",
	"qian feng",
	"qian fu",
	"qian ke",
	"qian li",
	"qian nian",
	"qian qi",
	"qian qu",
	"qian ren",
	"qian tou",
	"qian xian",
	"qian yan",
	"qian yuan",
	"qian zhan",
	"qian zhao",
	"qian zhi",
	"qian jing",
	"qian shu",
	"qian gong",
	"qian hui",
	"qian ru",
	"qian xin",
	"qian xing",
	"qian ju",
	"qian jian",
	"qian tan",
	"qian fan",
	"qian chan",
	"qian kuan",
	"qian shen",
	"qian shi",
	"qian jiu",
	"qian shou",
	"qian yi",
	"qiang ji",
	"qiang bi",
	"qiang di",
	"qiang diao",
	"qiang du",
	"qiang jian",
	"qiang liang",
	"qiang ren",
	"qiang sheng",
	"qiang shou",
	"qiang zhan",
	"qiang zhi",
	"qiang bao",
	"qiang jiao",
	"qiang mian",
	"qiang wei",
	"qiang da",
	"qiang duo",
	"qiang gong",
	"qiang shang",
	"qiang xian",
	"qiang yan",
	"qiao ji",
	"qiao zhuang",
	"qiao ran",
	"qiao li",
	"qiao shou",
	"qie ji",
	"qie qie",
	"qie xiao",
	"qin shu",
	"qin zi",
	"qin shi",
	"qin sheng",
	"qin xian",
	"qin shou",
	"qin jian",
	"qin jin",
	"qin zheng",
	"qing se",
	"qing xia",
	"qing dan",
	"qing fu",
	"qing qi",
	"qing sheng",
	"qing shi",
	"qing song",
	"qing yang",
	"qing yi",
	"qing zhong",
	"qing dao",
	"qing jiao",
	"qing xie",
	"qing xin",
	"qing zhu",
	"qing ce",
	"qing cha",
	"qing chang",
	"qing chao",
	"qing chu",
	"qing chun",
	"qing cui",
	"qing feng",
	"qing gui",
	"qing huo",
	"qing jie",
	"qing jing",
	"qing ku",
	"qing li",
	"qing lian",
	"qing liang",
	"qing pan",
	"qing qu",
	"qing shen",
	"qing suan",
	"qing tan",
	"qing tian",
	"qing wa",
	"qing xi",
	"qing xian",
	"qing xiang",
	"qing xing",
	"qing ya",
	"qing yin",
	"qing you",
	"qing yu",
	"qing zhang",
	"qing zheng",
	"qing ting",
	"qing cao",
	"qing di",
	"qing hai",
	"qing ji",
	"qing kuang",
	"qing lang",
	"qing lv",
	"qing sha",
	"qing shang",
	"qing si",
	"qing su",
	"qing tai",
	"qing wei",
	"qing yuan",
	"qing yun",
	"qing zhi",
	"qing zhuang",
	"qing hao",
	"qing ming",
	"qing ke",
	"qing bian",
	"qing diao",
	"qing jia",
	"qing jian",
	"qing qiu",
	"qing wu",
	"qing ying",
	"qing dian",
	"qing gong",
	"qing he",
	"qing jin",
	"qiu bo",
	"qiu liang",
	"qiu yi",
	"qiu he",
	"qiu qian",
	"qiu sheng",
	"qiu shi",
	"qiu shou",
	"qiu yu",
	"qiu zhen",
	"qiu zhi",
	"qiu shui",
	"qiu ji",
	"qiu jing",
	"qiu xing",
	"qiu yuan",
	"qiu zhuang",
	"qu chi",
	"qu jie",
	"qu ju",
	"qu zhi",
	"qu chu",
	"qu xie",
	"qu gan",
	"qu bi",
	"qu feng",
	"qu fu",
	"qu shi",
	"qu yu",
	"qu cai",
	"qu dao",
	"qu jing",
	"qu qi",
	"qu qiao",
	"qu xiang",
	"qu xiao",
	"qu xin",
	"qu zi",
	"qu bing",
	"qu huo",
	"qu sheng",
	"qu hua",
	"qu tan",
	"qu wei",
	"quan cheng",
	"quan jing",
	"quan sheng",
	"quan tao",
	"quan jian",
	"quan li",
	"quan neng",
	"quan shi",
	"quan shu",
	"quan wei",
	"quan xian",
	"quan yi",
	"quan ze",
	"quan yuan",
	"quan ji",
	"quan quan",
	"quan yu",
	"quan fu",
	"quan jia",
	"quan jie",
	"quan mian",
	"quan you",
	"quan zhi",
	"qiao zi",
	"que shi",
	"que xi",
	"que zhen",
	"qun ju",
]

	let R = ["ran fang",
	"ran liao",
	"ran zhi",
	"re chao",
	"re du",
	"re huo",
	"re qi",
	"re ya",
	"ren ding",
	"ren ji",
	"ren jia",
	"ren ming",
	"ren shen",
	"ren shi",
	"ren ti",
	"ren yu",
	"ren yuan",
	"ren zhi",
	"ren zhong",
	"ren ci",
	"ren yi",
	"ren zheng",
	"ren shou",
	"ren xin",
	"ren shu",
	"ren kou",
	"ren sheng",
	"ren tong",
	"ren tou",
	"ren wei",
	"ren cong",
	"ren he",
	"ren ke",
	"ren qi",
	"ren wu",
	"ren xing",
	"ren xuan",
	"ri chang",
	"ri jian",
	"rong mao",
	"rong hua",
	"rong ji",
	"rong guang",
	"rong ren",
	"rong yi",
	"rong rong",
	"rong yan",
	"rong he",
	"rong hui",
	"rong jie",
	"rong yuan",
	"rou mei",
	"rou he",
	"rou pu",
	"rou wan",
	"rou zhi",
	"ru ci",
	"ru qi",
	"ru yi",
	"ru shang",
	"ru shu",
	"ru shi",
	"ru dong",
	"ru jiao",
	"ru ya",
	"ru ming",
	"ru chang",
	"ru dang",
	"ru er",
	"ru gu",
	"ru hua",
	"ru ji",
	"ru jing",
	"ru kou",
	"ru mo",
	"ru wei",
	"ru xi",
	"ru xue",
	"ru yan",
	"ru yuan",
	"ru zhu",
	"ru zi",
	"ruan hua",
	"ruan ti",
	"run shi",
	"ruo shi",]

	let S = ["sa luo",
	"sai che",
	"san bao",
	"san fu",
	"san wei",
	"san xian",
	"san bu",
	"san gong",
	"san ji",
	"san jian",
	"san xi",
	"sang zi",
	"sang jia",
	"sang qi",
	"sang shen",
	"sang shi",
	"sao zi",
	"sao yang",
	"se ze",
	"sha bao",
	"sha fa",
	"sha hai",
	"sha huang",
	"sha ji",
	"sha qi",
	"sha jin",
	"sha long",
	"sha guo",
	"sha yan",
	"sha yu",
	"sha hua",
	"sha zi",
	"sha che",
	"sha shi",
	"shai zi",
	"shan dong",
	"shan feng",
	"shan huo",
	"shan ji",
	"shan jing",
	"shan ling",
	"shan lu",
	"shan shi",
	"shan xi",
	"shan xiang",
	"shan yao",
	"shan ding",
	"shan jian",
	"sha shu",
	"shan shan",
	"shan dian",
	"shan liang",
	"shan shen",
	"shan xian",
	"shan yan",
	"shan xiao",
	"shan bao",
	"shan xing",
	"shan yu",
	"shan quan",
	"shan zi",
	"shan yang",
	"shang hao",
	"shang hai",
	"shang ji",
	"shang jie",
	"shang qing",
	"shang ren",
	"shang ye jie",
	"shang wu",
	"shang fa",
	"shang jian",
	"shang shi",
	"shang yue",
	"shang ban",
	"shang bei",
	"shang biao",
	"shang bu",
	"shang cai",
	"shang chang",
	"shang cheng",
	"shang chuan",
	"shang cuan xia tiao",
	"shang diao",
	"shang fang",
	"shang fen",
	"shang feng",
	"shang gan",
	"shang gang",
	"shang gong",
	"shang gu",
	"shang guang",
	"shang hui",
	"shang huo",
	"shang jia",
	"shang jiao",
	"shang jin",
	"shang kou",
	"shang lian",
	"shang liang",
	"shang lu",
	"shang pin",
	"shang qian",
	"shang shen",
	"shang sheng",
	"shang shou",
	"shang shu",
	"shang shui",
	"shang su",
	"shang tao",
	"shang wang",
	"shang xian",
	"shang xiang",
	"shang xin",
	"shang xing",
	"shang yi",
	"shang you",
	"shang zhang",
	"shang dai",
	"shang ke",
	"shang wei",
	"shao hua",
	"shao zhi",
	"shao hou",
	"shao jian",
	"shao shi",
	"shao wei",
	"shao xiang",
	"shao xu",
	"shao bing",
	"shao zi",
	"she mi",
	"she tou",
	"she xing",
	"she zu",
	"she li",
	"she shi",
	"she tan",
	"she xiang",
	"she zhang",
	"she huo",
	"she ji",
	"she jian",
	"she xian",
	"she lie",
	"she fu",
	"she qu",
	"she zhi",
	"shen bian",
	"shen jia",
	"shen shang",
	"shen shi",
	"shen shou",
	"shen zi",
	"shen chang",
	"shen hou",
	"shen jiao",
	"shen qing",
	"shen wang",
	"shen xin",
	"shen yuan",
	"shen zhan",
	"shen zhi",
	"shen cai",
	"shen chi",
	"shen dao",
	"shen hua",
	"shen ling",
	"shen ming",
	"shen qi",
	"shen se",
	"shen si",
	"shen su",
	"shen tan",
	"shen tong",
	"shen wei",
	"shen xian",
	"shen xue",
	"shen yi",
	"shen you",
	"shen yun",
	"shen cha",
	"shen chu",
	"shen ding",
	"shen du",
	"shen gao",
	"shen he",
	"shen kan",
	"shen li",
	"shen shen",
	"shen ti",
	"shen xiao",
	"shen er",
	"shen yu",
	"shen ru",
	"shen tou",
	"shen mi",
	"shen xing",
	"shen yan",
	"shen zhong",
	"sheng cai",
	"sheng fu",
	"sheng huo",
	"sheng ji",
	"sheng jiang",
	"sheng kong",
	"sheng li",
	"sheng pi",
	"sheng ping",
	"sheng qi",
	"sheng qian",
	"sheng ren",
	"sheng se",
	"sheng shi",
	"sheng si",
	"sheng teng",
	"sheng xiao",
	"sheng ya",
	"sheng yi",
	"sheng yu",
	"sheng zhi",
	"sheng bian",
	"sheng cheng",
	"sheng ming",
	"sheng mu",
	"sheng wei",
	"sheng xi",
	"sheng yang",
	"sheng yuan",
	"sheng zhang",
	"sheng chu",
	"sheng jing",
	"sheng ju",
	"sheng su",
	"sheng ge",
	"sheng tao",
	"sheng zi",
	"sheng fen",
	"sheng qu",
	"sheng di",
	"sheng ling",
	"sheng shou",
	"sheng shui",
	"sheng chan",
	"sheng hui",
	"sheng shu",
	"sheng xing",
	"sheng yan",
	"sheng xia",
	"shi jian",
	"shi li",
	"shi shen",
	"shi shi",
	"shi shou",
	"shi wu",
	"shi xiao",
	"shi xue",
	"shi yi",
	"shi zhen",
	"shi chuan",
	"shi cong",
	"shi di",
	"shi fu",
	"shi jie",
	"shi sheng",
	"shi ye",
	"shi zi",
	"shi ge",
	"shi hua",
	"shi ji",
	"shi jing",
	"shi ju",
	"shi ti",
	"shi you",
	"shi jiao",
	"shi she",
	"shi xing",
	"shi yu",
	"shi zhi",
	"shi zhu",
	"shi fen",
	"shi jia",
	"shi zu",
	"shi jin",
	"shi ban",
	"shi bi",
	"shi diao",
	"shi fang",
	"shi hui",
	"shi jiu",
	"shi mian",
	"shi mo",
	"shi qi",
	"shi yin",
	"shi ying",
	"shi bao",
	"shi cha",
	"shi chang",
	"shi ke",
	"shi kong",
	"shi ling",
	"shi qu",
	"shi ren",
	"shi shang",
	"shi su",
	"shi tai",
	"shi wen",
	"shi xian",
	"shi xin",
	"shi xu",
	"shi yun",
	"shi zheng",
	"shi zhong",
	"shi huo",
	"shi xiang",
	"shi ce",
	"shi cheng",
	"shi ci",
	"shi gan",
	"shi ming",
	"shi shu",
	"shi yan",
	"shi yong",
	"shi zai",
	"shi ze",
	"shi zhan",
	"shi dao",
	"shi liang",
	"shi liao",
	"shi tang",
	"shi guan",
	"shi chen",
	"shi de",
	"shi huan",
	"shi fa",
	"shi dai",
	"shi gu",
	"shi qing",
	"shi xi",
	"shi xiong",
	"shi nv",
	"shi tu",
	"shi mu",
	"shi fan",
	"shi wei",
	"shi duan",
	"shi gong",
	"shi guo jing qian",
	"shi hou",
	"shi qian",
	"shi feng",
	"shi zhe",
	"shi bu ke dang",
	"shi tou",
	"shi chuang",
	"shi dian",
	"shi pin",
	"shi biao",
	"shi du",
	"shi fei",
	"shi jiang",
	"shi kan",
	"shi tan",
	"shi ting",
	"shi yang",
	"shi bu shi",
	"shi bing",
	"shi cai",
	"shi dang",
	"shi he",
	"shi kou",
	"shi huai",
	"shi ran",
	"shi hao",
	"shi bu liang li",
	"shi yue",
	"shou fu",
	"shou lian",
	"shou shi",
	"shou shou",
	"shou zhi",
	"shou bao",
	"shou bi",
	"shou bian",
	"shou bing",
	"shou fa",
	"shou gong",
	"shou ji",
	"shou jiao",
	"shou jin",
	"shou juan",
	"shou lu",
	"shou qi",
	"shou shu",
	"shou xi",
	"shou xin",
	"shou yang",
	"shou yi",
	"shou yin",
	"shou yu",
	"shou zhang",
	"shou zu",
	"shou bei",
	"shou cheng",
	"shou lei",
	"shou ling",
	"shou wei",
	"shou xiao",
	"shou ye",
	"shou chang",
	"shou du",
	"shou fa shi",
	"shou fei",
	"shou jie",
	"shou li",
	"shou xiang",
	"shou ying",
	"shou ban",
	"shou jiu",
	"shou mu",
	"shou tao",
	"shou xian",
	"shou yan",
	"shou zhong",
	"shou chao",
	"shou dao",
	"shou di",
	"shou gu",
	"shou han",
	"shou hui",
	"shou jian",
	"shou jiang",
	"shou jing",
	"shou kan",
	"shou ming",
	"shou qu",
	"shou ru",
	"shou shang",
	"shou shen",
	"shou ti",
	"shou ting",
	"shou xing",
	"shou yao",
	"shou yuan",
	"shou yue",
	"shou hou",
	"shou huo",
	"shou mai",
	"shou qing",
	"shou fen",
	"shou quan",
	"shou xun",
	"shou dai",
	"shu bao",
	"shu ji",
	"shu xiang",
	"shu fa",
	"shu xie",
	"shu mu",
	"shu hu",
	"shu li",
	"shu mi",
	"shu yuan",
	"shu chang",
	"shu fu",
	"shu juan",
	"shu san",
	"shu shi",
	"shu song",
	"shu xin",
	"shu zhan",
	"shu chu",
	"shu dian",
	"shu jia",
	"shu ye",
	"shu jie",
	"shu an",
	"shu cai",
	"shu di",
	"shu hua",
	"shu ren",
	"shu xi",
	"shu yu",
	"shu qi",
	"shu zi",
	"shu ming",
	"shu han",
	"shu jin",
	"shu lei",
	"shu shou",
	"shu shen",
	"shu yao",
	"shu zhuang",
	"shu huai",
	"shu ping",
	"shu zhi",
	"shu pi",
	"shu jing",
	"shu zui",
	"shu wu",
	"shu ju",
	"shu luo",
	"shu shuo",
	"shu xue",
	"shuai tui",
	"shuai qi",
	"shuang xiang",
	"shuang mu",
	"shuang qi",
	"shuang xing",
	"shui ba",
	"shui cao",
	"shui dao",
	"shui fa",
	"shui gou",
	"shui huo",
	"shui jing",
	"shui lao",
	"shui li",
	"shui lu",
	"shui ta",
	"shui wen",
	"shui xian",
	"shui xiang",
	"shui xing",
	"shui xiu",
	"shui ya",
	"shui yin",
	"shui zhi",
	"shui zhu",
	"shui fei",
	"shui lv",
	"shui mu",
	"shui piao",
	"shui shou",
	"shui wu",
	"shui yuan",
	"shui ze",
	"shui zhong",
	"shui jiao",
	"shui ku",
	"shui mian",
	"shui pao",
	"shui yan",
	"shui yi",
	"shun liu",
	"shun xu",
	"shun yan",
	"shun shi",
	"shun xi",
	"shuo he",
	"si xian",
	"si chou",
	"si fa",
	"si fang",
	"si li",
	"si yu",
	"si lu",
	"si nian",
	"si xiang",
	"si yi",
	"si shu",
	"si jiao",
	"si che",
	"si da",
	"si dang",
	"si di",
	"si hui",
	"si huo",
	"si ji",
	"si mian",
	"si ming",
	"si qi",
	"si qiu",
	"si ren",
	"si shang",
	"si shi",
	"si shou",
	"si xin",
	"si xing",
	"si ying",
	"si bian",
	"si chu",
	"si gu",
	"si hua",
	"si jian",
	"si jin",
	"si qing",
	"si wei",
	"si xia li",
	"si zhi",
	"si yuan",
	"ci hou",
	"si liao",
	"si zi",
	"song jin",
	"song shu",
	"song zhi",
	"song dong",
	"song jian",
	"song li",
	"song ming",
	"song qi",
	"song shen",
	"song zhan",
	"su yuan",
	"su cai",
	"su cheng",
	"su jing",
	"su you",
	"su zhuang",
	"su du",
	"su hua",
	"su di",
	"su ji",
	"su ming",
	"su she",
	"su zhu",
	"su xing",
	"suan shi",
	"suan shu",
	"suan zhang",
	"sui ji",
	"sui yuan",
	"sui chu",
	"sui shou",
	"sui xin",
	"sui yi",
	"sui shi",
	"suo wei",
	"suo yi",
	"suo yin",
	"suo shi",
	"suo xie",
	"suo bian",]

	let T = ["ta men",
	"ta fang",
	"ta kan",
	"tai bu",
	"tai ji",
	"tai pan",
	"tai shang",
	"tai zi",
	"tai jiao",
	"tai jian",
	"tai shi",
	"tai shan",
	"tan pai",
	"tan tu",
	"tan zi",
	"tan hua",
	"tan xin",
	"tan xing",
	"tan yu",
	"tan cheng",
	"tan dang",
	"tan zhi",
	"tan lu",
	"tan ci",
	"tan xi",
	"tan cha",
	"tan fang",
	"tan feng",
	"tan qiu",
	"tan shang",
	"tan tou",
	"tan xian",
	"tan xun",
	"tang chi",
	"tang di",
	"tang bao",
	"tang guo",
	"tang shi",
	"tang zhi",
	"tang lei",
	"tang yi",
	"tang mian",
	"tang shang",
	"tao li",
	"tao su",
	"tao tao",
	"tao yi",
	"tao qi",
	"tao fan",
	"tao rao",
	"tao zhai",
	"tao fu",
	"tao hong",
	"tao hua",
	"tao hui",
	"tao jian",
	"tao piao",
	"tao qu",
	"tao sheng",
	"tao shu",
	"tao yong",
	"tao zi",
	"te ji",
	"te she",
	"te wu",
	"te xu",
	"te yi",
	"te you",
	"te zhi",
	"teng yue",
	"ti ji",
	"ti ming",
	"ti qin",
	"ti shen",
	"ti xing",
	"ti ba",
	"ti ci",
	"ti ku",
	"ti qian",
	"ti shi",
	"ti xie",
	"ti yi",
	"ti zhi",
	"ti zi",
	"ti cai",
	"ti chang",
	"ti fa",
	"ti li",
	"ti liang",
	"ti ren",
	"ti wei",
	"ti wen",
	"ti du",
	"ti tou",
	"ti gong",
	"ti shou",
	"tian di",
	"tian gong",
	"tian ji",
	"tian liang",
	"tian ming",
	"tian shi",
	"tian shu",
	"tian ti",
	"tian xian",
	"tian zi",
	"tian cai",
	"tian jia",
	"tian se",
	"tian zhi",
	"tian fu",
	"tian jing",
	"tian mu",
	"tian qi",
	"tian she",
	"tian tou",
	"tian ran",
	"tian bu",
	"tian fang",
	"tian kong",
	"tian ya",
	"tiao fu",
	"tiao shi",
	"tiao suo",
	"tiao zi",
	"tiao bo",
	"tiao deng",
	"tiao jian",
	"tiao li",
	"tiao wen",
	"tiao dong",
	"tiao jiao",
	"tiao yue",
	"tie jin",
	"tie bi",
	"tie gui",
	"tie qi",
	"tie sha",
	"tie shui",
	"tie xian",
	"tie xin",
	"ting zheng",
	"ting shen",
	"ting yuan",
	"ting ban",
	"ting bo",
	"ting jian",
	"ting ke",
	"ting shi",
	"ting xi",
	"ting xie",
	"ting xin",
	"ting zhi",
	"ting li",
	"tong chang",
	"tong guan",
	"tong lan",
	"tong li",
	"tong ming",
	"tong tong",
	"tong xiao",
	"tong xing",
	"tong ban",
	"tong bao",
	"tong dao",
	"tong hao",
	"tong hua",
	"tong huo",
	"tong ji",
	"tong ling",
	"tong lu",
	"tong qi",
	"tong ren",
	"tong shang",
	"tong shi",
	"tong xiang",
	"tong xin",
	"tong xin yuan",
	"tong hang",
	"tong ye",
	"tong zhi",
	"tong hong",
	"tong you",
	"tong bi",
	"tong jing",
	"tong qian",
	"tong xiu",
	"tong yuan",
	"tong bian",
	"tong che",
	"tong gong",
	"tong meng",
	"tong nian",
	"tong qu",
	"tong sheng",
	"tong zhen",
	"tong zi",
	"tong cheng",
	"tong shuai",
	"tong yi",
	"tong shu",
	"tong ku",
	"tong chu",
	"tong da",
	"tong wu",
	"tong feng",
	"tong gan",
	"tong xi",
	"tong yang",
	"tong yin",
	"tou lu",
	"tou pai",
	"tou qian",
	"tou sheng",
	"tou xian",
	"tou yan",
	"tou yun",
	"tou an",
	"tou di",
	"tou du",
	"tou gong",
	"tou he",
	"tou ji",
	"tou xiang",
	"tou kao",
	"tou lan",
	"tou shi",
	"tou shui",
	"tou su",
	"tou tai",
	"tou wei",
	"tou ying",
	"tou zi",
	"tou pi",
	"tou ding",
	"tou gu",
	"tou jing",
	"tou lou",
	"tou ming",
	"tou she",
	"tou xi",
	"tou zhi",
	"tu xian",
	"tu chu",
	"tu qi",
	"tu ban",
	"tu ding",
	"tu ji",
	"tu li",
	"tu ran",
	"tu xing",
	"tu pian",
	"tu shi",
	"tu jing",
	"tu cheng",
	"tu lu",
	"tu bu",
	"tu ceng",
	"tu di",
	"tu fa",
	"tu fang",
	"tu fei",
	"tu gai",
	"tu hua",
	"tu jian",
	"tu po",
	"tu shan",
	"tu yu",
	"tu zhi",
	"tu mo",
	"tu si",
	"tu tan",
	"tu xie",
	"tu zi",
	"tuan ji",
	"tuan yuan",
	"tui dao",
	"tui ji",
	"tui jian",
	"tui li",
	"tui tuo",
	"tui yan",
	"tui sang",
	"tui zi",
	"tui huan",
	"tui ju",
	"tui que",
	"tui rang",
	"tui wei",
	"tui yi",
	"tui zhi",
	"tui hua",
	"tun shi",
	"tun bing",
	"tun ji",
	"tuo ci",
	"tuo fu",
	"tuo gu",
	"tuo yun",
	"tuo ba",
	"tuo li",
	"tuo mao",
	"tuo pi",
	"tuo shen",
	"tuo shou",
	"tuo xie",
	"tuo yan",
	"tuo luo",
	"tuo zi",
	"tuo se",
	"tuo dang",
	"tuo ye",]


	let FiP = ["pen -peng ", "pin -ping "]
	let FiQ = ["qian -qiang ", "qin -qing "]
	let FiR = ["rong -rou ", "ru -rou "]
	let FiS = ["san -sang ", "shan -shang ", "shen -sheng ", "si -shi ", "shu -su ", "shui -sui ", "shuang -suan "]
	let FiT = ["tan -tang ", "tian -tie ", "tou -tu "]



}