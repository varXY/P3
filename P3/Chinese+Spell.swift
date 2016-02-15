//
//  Chinese+Spell.swift
//  P3
//
//  Created by 文川术 on 2/11/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {

	func getOneForSpell() {

		forSpell.removeAll()

		repeat {
			
			let randomIndex = getRandomNumbers(1, lessThan: 52936)
			let pinyin = pinyinFromIndex(Double(randomIndex[0]))

			let yins = pinyin.componentsSeparatedByString(" ")
			let words = wordsFromPinyin(pinyin)

			if words.count >= 1 {
				let index = getRandomNumbers(1, lessThan: words.count)[0]
				if words[index].characters.count == yins.count {
					forSpell.append(pinyin)
					forSpell.append(words[index])

				}
			}

		} while forSpell.count < 2

	}
}