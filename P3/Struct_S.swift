//
//  Struct_S.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Struct_S: Characters {
	var characters: [String]

	init(pinyin: String) {
		switch pinyin {
		case "sa":  characters = ["撒", "洒", "萨"]
		case "sai":  characters = ["腮", "鳃", "赛", "塞"]
		case "san":  characters = ["三", "叁", "伞", "散"]
		case "sang":  characters = ["桑", "嗓", "丧"]
		case "sao":  characters = ["搔", "骚", "扫", "嫂", "梢"]
		case "se":  characters = ["瑟", "涩", "塞", "色"]
		case "sen":  characters = ["森"]
		case "seng":  characters = ["僧"]
		case "sha":  characters = ["砂", "杀", "沙", "纱", "傻", "啥", "煞", "莎", "刹", "杉", "厦"]
		case "shai":  characters = ["筛", "晒", "色"]
		case "shan":  characters = ["珊", "苫", "山", "删", "煽", "衫", "闪", "陕", "擅", "赡", "膳", "善", "汕", "扇", "缮", "杉", "栅", "掺", "单"]
		case "shang":  characters = ["墒", "伤", "商", "赏", "晌", "上", "尚", "裳", "汤"]
		case "shao":  characters = ["捎", "稍", "烧", "芍", "勺", "韶", "少", "哨", "邵", "绍", "鞘", "梢", "召"]
		case "she":  characters = ["奢", "赊", "舌", "舍", "赦", "摄", "慑", "涉", "社", "设", "蛇", "拾", "折", "射"]
		case "shen":  characters = ["砷", "申", "呻", "伸", "身", "深", "绅", "神", "审", "婶", "肾", "慎", "渗", "沈", "甚", "参", "娠", "什"]
		case "sheng":  characters = ["声", "生", "甥", "牲", "升", "绳", "剩", "胜", "圣", "乘", "省", "盛"]
		case "shi":  characters = ["师", "失", "狮", "施", "湿", "诗", "尸", "虱", "十", "时", "蚀", "实", "史", "矢", "使", "屎", "驶", "始", "式", "示", "士", "世", "柿", "事", "拭", "誓", "逝", "势", "是", "嗜", "噬", "适", "仕", "侍", "释", "饰", "市", "恃", "室", "视", "试", "匙", "石", "拾", "食", "识", "氏", "似", "嘘", "殖", "峙", "什"]
		case "shou":  characters = ["收", "手", "首", "守", "寿", "授", "售", "受", "瘦", "兽", "熟"]
		case "shu":  characters = ["蔬", "枢", "梳", "殊", "抒", "输", "叔", "舒", "淑", "疏", "书", "赎", "孰", "薯", "暑", "曙", "署", "蜀", "黍", "鼠", "述", "树", "束", "戍", "竖", "墅", "庶", "漱", "恕", "熟", "属", "术", "数"]
		case "shua":  characters = ["刷", "耍"]
		case "shuai":  characters = ["摔", "甩", "帅", "衰", "率"]
		case "shuan":  characters = ["栓", "拴"]
		case "shuang":  characters = ["霜", "双", "爽"]
		case "shui":  characters = ["水", "睡", "税", "谁", "说"]
		case "shun":  characters = ["吮", "瞬", "顺", "舜"]
		case "shuo":  characters = ["硕", "朔", "烁", "数", "说"]
		case "si":  characters = ["斯", "撕", "嘶", "私", "司", "丝", "死", "肆", "寺", "嗣", "四", "饲", "巳", "食", "思", "伺", "似"]
		case "song":  characters = ["松", "耸", "怂", "颂", "送", "宋", "讼", "诵"]
		case "sou":  characters = ["搜", "擞", "嗽", "艘"]
		case "su":  characters = ["苏", "酥", "俗", "素", "速", "粟", "僳", "塑", "溯", "诉", "肃", "宿", "缩"]
		case "suan":  characters = ["酸", "蒜", "算"]
		case "sui":  characters = ["虽", "隋", "随", "绥", "髓", "碎", "岁", "穗", "遂", "隧", "祟", "尿"]
		case "sun":  characters = ["孙", "损", "笋"]
		case "suo":  characters = ["蓑", "梭", "唆", "琐", "索", "锁", "所", "莎", "缩"]
		default:  characters = [""]
		}
	}
}