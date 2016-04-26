//
//  Struct_B.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Struct_B: Characters {
	var characters: [String]

	init(pinyin: String) {
		switch pinyin {
		case "ba":  characters = ["芭", "捌", "叭", "吧", "笆", "八", "疤", "巴", "拔", "跋", "靶", "把", "坝", "霸", "罢", "爸", "扒", "耙"]
		case "bai":  characters = ["白", "摆", "佰", "败", "拜", "柏", "百", "稗", "伯"]
		case "ban":  characters = ["斑", "班", "搬", "扳", "颁", "板", "版", "扮", "拌", "伴", "瓣", "半", "办", "绊", "般"]
		case "bang":  characters = ["邦", "帮", "梆", "榜", "绑", "棒", "镑", "傍", "谤", "膀", "磅", "蚌"]
		case "bao":  characters = ["苞", "胞", "包", "褒", "雹", "保", "饱", "宝", "抱", "报", "豹", "鲍", "爆", "剥", "薄", "暴", "刨", "炮", "曝", "瀑", "堡"]
		case "bei":  characters = ["杯", "碑", "悲", "卑", "北", "辈", "背", "贝", "钡", "倍", "狈", "备", "惫", "焙", "被"]
		case "ben":  characters = ["奔", "苯", "本", "笨"]
		case "beng":  characters = ["崩", "绷", "甭", "泵", "蹦", "迸", "蚌"]
		case "bi":  characters = ["逼", "鼻", "比", "鄙", "笔", "彼", "碧", "蓖", "蔽", "毕", "毙", "毖", "币", "庇", "痹", "闭", "敝", "弊", "必", "壁", "避", "陛", "辟", "臂", "秘"]
		case "bian":  characters = ["鞭", "边", "编", "贬", "变", "卞", "辨", "辩", "辫", "扁", "便", "遍"]
		case "biao":  characters = ["标", "彪", "膘", "表"]
		case "bie":  characters = ["鳖", "憋", "别", "瘪"]
		case "bin":  characters = ["彬", "斌", "濒", "滨", "宾", "摈"]
		case "bing":  characters = ["兵", "冰", "柄", "丙", "秉", "饼", "炳", "病", "并", "屏"]
		case "bo":  characters = ["玻", "菠", "播", "拨", "钵", "博", "勃", "搏", "铂", "箔", "帛", "舶", "脖", "膊", "渤", "驳", "柏", "剥", "薄", "波", "泊", "卜", "般", "伯"]
		case "bu":  characters = ["捕", "哺", "补", "埠", "布", "步", "簿", "部", "怖", "卜", "不", "埔", "堡"]
		default:  characters = [""]
		}
	}
}