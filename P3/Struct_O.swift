//
//  Struct_O.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation



struct Struct_O: Characters {
	var characters: [String]

	init(pinyin: String) {
		switch pinyin {
		case "o":  characters = ["哦"]
		case "ou":  characters = ["欧", "鸥", "殴", "藕", "呕", "偶", "沤", "区"]
		default:  characters = [""]
		}
	}
}