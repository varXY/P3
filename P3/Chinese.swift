//
//  Chinese.swift
//  P3
//
//  Created by 文川术 on 2/8/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation

struct Chinese: WordCharacterPinyin {

	let pinyins = Pinyins()

	var forSameOrNot = [[String]]()
	var forSelectTheSame = [[String]]()
	var forSpell = [String]()

	init() {
		getSixForSelectTheSame()
	}
}











