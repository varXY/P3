//
//  Struct_A.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Struct_A {
	var characters: [String]!

	init(pinyin: String) {
		switch pinyin {
		case "a":  characters = ["啊", "阿", "呵"]
		case "ai":  characters = ["埃", "挨", "哎", "唉", "哀", "皑", "蔼", "矮", "碍", "爱", "隘", "癌", "艾"]
		case "an":  characters = ["鞍", "氨", "安", "俺", "按", "暗", "岸", "胺", "案"]
		case "ang":  characters = [ "肮", "昂", "盎"]
		case "ao":  characters = ["凹", "敖", "熬", "翱", "袄", "傲", "奥", "懊", "澳"]
		default:  characters = ["无"]
		}
	}
}


