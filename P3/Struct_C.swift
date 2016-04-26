//
//  Struct_C.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Struct_C: Characters {
	var characters: [String]

	init(pinyin: String) {
		switch pinyin {
		case "ca":  characters = ["擦"]
		case "cai":  characters = ["猜", "裁", "材", "才", "财", "睬", "踩", "采", "彩", "菜", "蔡"]
		case "can":  characters = ["餐", "残", "惭", "惨", "灿", "蚕", "参", "掺"]
		case "cang":  characters = ["苍", "舱", "仓", "沧", "藏"]
		case "cao":  characters = ["操", "糙", "槽", "曹", "草"]
		case "ce":  characters = ["策", "册", "测", "厕", "侧"]
		case "cen":  characters = ["参"]
		case "ceng":  characters = ["层", "蹭", "曾"]
		case "cha":  characters = ["插", "叉", "茶", "碴", "搽", "察", "岔", "诧", "茬", "查", "刹", "喳", "差"]
		case "chai":  characters = ["柴", "豺", "拆", "差"]
		case "chan":  characters = ["搀", "蝉", "馋", "谗", "缠", "铲", "产", "阐", "颤", "掺", "单"]
		case "chang":  characters = ["昌", "猖", "场", "尝", "常", "偿", "肠", "厂", "畅", "唱", "倡", "长", "敞", "裳"]
		case "chao":  characters = ["超", "抄", "钞", "潮", "巢", "吵", "炒", "朝", "嘲", "绰", "剿"]
		case "che":  characters = ["扯", "撤", "掣", "彻", "澈", "车"]
		case "chen":  characters = ["郴", "臣", "辰", "尘", "晨", "忱", "沉", "陈", "趁", "衬", "橙", "沈", "称", "秤"]
		case "cheng":  characters = ["撑", "城", "成", "呈", "程", "惩", "诚", "承", "逞", "骋", "橙", "乘", "澄", "盛", "称", "秤"]
		case "chi":  characters = ["痴", "持", "池", "迟", "弛", "驰", "耻", "齿", "侈", "赤", "翅", "斥", "炽", "吃", "匙", "尺"]
		case "chong":  characters = ["充", "冲", "崇", "宠", "虫", "重"]
		case "chou":  characters = ["抽", "酬", "畴", "踌", "稠", "愁", "筹", "仇", "绸", "瞅", "丑", "臭"]
		case "chu":  characters = ["初", "出", "橱", "厨", "躇", "锄", "雏", "滁", "除", "楚", "础", "储", "矗", "搐", "触", "处", "畜"]
		case "chuai":  characters = ["揣"]
		case "chuan":  characters = ["川", "穿", "椽", "船", "喘", "串", "传"]
		case "chuang":  characters = ["疮", "窗", "床", "闯", "创"]
		case "chui":  characters = ["吹", "炊", "捶", "锤", "垂", "椎"]
		case "chun":  characters = ["春", "椿", "醇", "唇", "淳", "纯", "蠢"]
		case "chuo":  characters = ["戳", "绰"]
		case "ci":  characters = ["疵", "茨", "磁", "雌", "辞", "慈", "瓷", "词", "此", "刺", "赐", "次", "伺", "兹", "差"]
		case "cong":  characters = ["聪", "葱", "囱", "匆", "从", "丛"]
		case "cou":  characters = ["凑"]
		case "cu":  characters = ["粗", "醋", "簇", "促", "卒"]
		case "cuan":  characters = ["蹿", "篡", "窜", "攒"]
		case "cui":  characters = ["摧", "崔", "催", "脆", "瘁", "粹", "淬", "翠"]
		case "cun":  characters = ["村", "存", "寸"]
		case "cuo":  characters = ["磋", "搓", "措", "挫", "错", "撮"]
		default:  characters = [""]
		}
	}
}