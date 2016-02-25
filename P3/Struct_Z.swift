//
//  Struct_Z.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation



struct Struct_Z {
	var characters: [String]!

	init(pinyin: String) {
		switch pinyin {
		case "za":  characters = ["匝", "砸", "杂", "扎", "咱", "咋"]
		case "zai":  characters = ["栽", "哉", "灾", "宰", "载", "再", "在", "仔"]
		case "zan":  characters = ["暂", "赞", "攒", "咱"]
		case "zang":  characters = ["赃", "脏", "葬", "藏"]
		case "zao":  characters = ["遭", "糟", "藻", "枣", "早", "澡", "蚤", "躁", "噪", "造", "皂", "灶", "燥", "凿"]
		case "ze":  characters = ["责", "则", "泽", "择", "侧", "咋"]
		case "zei":  characters = ["贼"]
		case "zen":  characters = ["怎"]
		case "zeng":  characters = ["增", "憎", "赠", "曾", "综"]
		case "zha":  characters = ["渣", "札", "铡", "闸", "眨", "榨", "乍", "炸", "诈", "查", "扎", "喳", "栅", "柞", "轧", "咋"]
		case "zhai":  characters = ["斋", "债", "寨", "翟", "祭", "择", "摘", "宅", "窄", "侧"]
		case "zhan":  characters = ["瞻", "毡", "詹", "沾", "盏", "斩", "辗", "崭", "展", "蘸", "栈", "占", "战", "站", "湛", "绽", "颤", "粘"]
		case "zhang":  characters = ["樟", "章", "彰", "漳", "张", "掌", "涨", "杖", "丈", "帐", "账", "仗", "胀", "瘴", "障", "长"]
		case "zhao":  characters = ["招", "昭", "找", "沼", "赵", "照", "罩", "兆", "肇", "朝", "召", "爪", "着"]
		case "zhe":  characters = ["遮", "哲", "蛰", "辙", "者", "蔗", "浙", "折", "锗", "这", "着"]
		case "zhen":  characters = ["珍", "斟", "真", "甄", "砧", "臻", "贞", "针", "侦", "枕", "疹", "诊", "震", "振", "镇", "阵", "帧"]
		case "zheng":  characters = ["蒸", "挣", "睁", "征", "狰", "争", "怔", "整", "拯", "正", "政", "症", "郑", "证"]
		case "zhi":  characters = ["芝", "支", "蜘", "知", "肢", "脂", "汁", "之", "织", "职", "直", "植", "执", "值", "侄", "址", "指", "止", "趾", "只", "旨", "纸", "志", "挚", "掷", "至", "致", "置", "帜", "制", "智", "秩", "稚", "质", "炙", "痔", "滞", "治", "窒", "识", "枝", "吱", "殖", "峙"]
		case "zhong":  characters = ["中", "盅", "忠", "钟", "衷", "终", "肿", "仲", "众", "种", "重"]
		case "zhou":  characters = ["舟", "周", "州", "洲", "诌", "轴", "肘", "帚", "咒", "皱", "宙", "昼", "骤", "粥"]
		case "zhu":  characters = ["珠", "株", "蛛", "朱", "猪", "诸", "诛", "逐", "竹", "烛", "煮", "拄", "瞩", "嘱", "主", "柱", "助", "蛀", "贮", "铸", "筑", "住", "注", "祝", "驻", "属", "著"]
		case "zhua":  characters = ["抓", "爪"]
		case "zhuai":  characters = ["拽"]
		case "zhuan":  characters = ["专", "砖", "撰", "篆", "传", "转", "赚"]
		case "zhuang":  characters = ["桩", "庄", "装", "妆", "壮", "状", "幢", "撞"]
		case "zhui":  characters = ["锥", "追", "赘", "坠", "缀", "椎"]
		case "zhun":  characters = ["谆", "准"]
		case "zhuo":  characters = ["捉", "拙", "卓", "桌", "茁", "酌", "啄", "灼", "浊", "琢", "缴", "着"]
		case "zi":  characters = ["咨", "资", "姿", "滋", "淄", "孜", "紫", "籽", "滓", "子", "自", "渍", "字", "吱", "兹", "仔"]
		case "zong":  characters = ["鬃", "棕", "踪", "宗", "总", "纵", "综"]
		case "zou":  characters = ["邹", "走", "奏", "揍"]
		case "zu":  characters = ["租", "族", "祖", "诅", "阻", "组", "足", "卒"]
		case "zuan":  characters = ["钻", "纂"]
		case "zui":  characters = ["嘴", "醉", "最", "罪"]
		case "zun":  characters = ["尊", "遵"]
		case "zuo":  characters = ["昨", "左", "佐", "做", "作", "坐", "座", "撮", "琢", "柞"]
		default:  characters = ["shit"]
		}
	}
}