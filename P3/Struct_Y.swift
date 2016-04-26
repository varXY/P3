//
//  Struct_Y.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Struct_Y: Characters {
	var characters: [String]

	init(pinyin: String) {
		switch pinyin {
		case "ya":  characters = ["压", "押", "鸦", "鸭", "呀", "丫", "牙", "蚜", "衙", "涯", "雅", "哑", "亚", "讶", "芽", "崖", "轧"]
		case "yan":  characters = ["焉", "阉", "淹", "盐", "严", "研", "蜒", "岩", "延", "言", "颜", "阎", "炎", "沿", "奄", "掩", "眼", "衍", "演", "艳", "堰", "燕", "厌", "砚", "雁", "唁", "彦", "焰", "宴", "谚", "验", "铅", "咽", "烟", "殷"]
		case "yang":  characters = ["殃", "央", "鸯", "秧", "杨", "扬", "佯", "疡", "羊", "洋", "阳", "氧", "仰", "痒", "养", "样", "漾"]
		case "yao":  characters = ["邀", "腰", "妖", "瑶", "摇", "尧", "遥", "窑", "谣", "姚", "咬", "舀", "药", "要", "耀", "约", "钥", "侥"]
		case "ye":  characters = ["椰", "噎", "耶", "爷", "野", "冶", "也", "页", "业", "夜", "咽", "掖", "叶", "腋", "液", "拽", "曳"]
		case "yi":  characters = ["一", "壹", "医", "揖", "铱", "依", "伊", "衣", "颐", "夷", "移", "仪", "胰", "疑", "沂", "宜", "姨", "彝", "椅", "蚁", "倚", "已", "乙", "矣", "以", "艺", "抑", "易", "邑", "亿", "役", "臆", "逸", "肄", "疫", "亦", "裔", "意", "毅", "忆", "义", "益", "溢", "诣", "议", "谊", "译", "异", "翼", "翌", "绎", "遗", "屹"]
		case "yin":  characters = ["茵", "荫", "因", "音", "阴", "姻", "吟", "银", "淫", "寅", "饮", "尹", "引", "隐", "印", "殷"]
		case "ying":  characters = ["英", "樱", "婴", "鹰", "应", "缨", "莹", "萤", "营", "荧", "蝇", "迎", "赢", "盈", "影", "颖", "硬", "映"]
		case "yo":  characters = ["哟"]
		case "yong":  characters = ["拥", "佣", "臃", "痈", "庸", "雍", "踊", "蛹", "咏", "泳", "永", "恿", "勇", "用", "涌"]
		case "you":  characters = ["幽", "优", "悠", "忧", "尤", "由", "邮", "铀", "犹", "油", "游", "酉", "有", "友", "右", "佑", "釉", "诱", "又", "幼"]
		case "yu":  characters = ["迂", "淤", "于", "盂", "榆", "虞", "愚", "舆", "逾", "鱼", "愉", "渝", "渔", "隅", "予", "娱", "雨", "与", "屿", "禹", "宇", "语", "羽", "玉", "域", "芋", "郁", "遇", "喻", "峪", "御", "愈", "欲", "狱", "誉", "浴", "寓", "裕", "预", "豫", "驭", "尉", "余", "俞", "吁", "育"]
		case "yuan":  characters = ["鸳", "渊", "冤", "元", "垣", "袁", "原", "援", "辕", "园", "圆", "猿", "源", "缘", "远", "苑", "愿", "怨", "院", "员"]
		case "yue":  characters = ["曰", "越", "跃", "岳", "粤", "月", "悦", "阅", "乐", "约", "钥"]
		case "yun":  characters = ["耘", "云", "郧", "匀", "陨", "允", "运", "蕴", "酝", "晕", "韵", "孕", "均", "员"]
		default:  characters = [""]
		}
	}
}