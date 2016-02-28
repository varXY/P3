//
//  Struct_E.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


struct Struct_E {
	var characters: [String]!

	init(pinyin: String) {
		switch pinyin {
		case "e":  characters = ["峨", "鹅", "俄", "额", "讹", "娥", "厄", "扼", "遏", "鄂", "饿", "阿", "蛾", "恶", "哦"]
		case "en":  characters = ["恩"]
		case "er":  characters = ["而", "耳", "尔", "饵", "洱", "二", "贰", "儿"]
		default:  characters = ["无"]
		}
	}
}