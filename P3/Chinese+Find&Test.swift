//
//  Chinese+Find&Test.swift
//  P3
//
//  Created by 文川术 on 2/24/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {

	func pinyinFromCharacter(character: String) {
		let str = NSMutableString(string: character) as CFMutableStringRef
		CFStringTransform(str, nil, kCFStringTransformMandarinLatin, false)
		CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false)
		print(str)
	}

	func printAllCharctersHaveSamePinyin(wordsCount: Int) {
		var results = [String]()
		for pinyin in allPossiblePinyin {
			let words = charactersFromPinyin(pinyin)
			if words.count >= wordsCount {
				results.append(pinyin)
			}
		}
		print(results)
		print(results.count)
	}

	func confusablePinyin_Different_Test() {
		for couple in confusablePinyin_Different {
			let pinyins = couple.componentsSeparatedByString(" ")

			let words_0 = charactersFromPinyin(pinyins[0])
			if words_0.count == 0 { print(pinyins[0]) }

			let words_1 = charactersFromPinyin(pinyins[1])
			if words_1.count == 0 { print(pinyins[1]) }

			if pinyins.count != 2 { print(pinyins) }
		}
	}

	func confusablePinyinOfWord_Different_Test() {
		for couple in confusablePinyinOfWord_Different {
			let wordPinyins = couple.componentsSeparatedByString("-")

			let words_0 = wordsFromPinyin(wordPinyins[0])
			if words_0.count == 0 { print(wordPinyins[0]) }

			let words_1 = wordsFromPinyin(wordPinyins[1])
			if words_1.count == 0 { print(wordPinyins[1]) }

			if wordPinyins.count != 2 { print(wordPinyins) }
		}
	}

	func findPolyphone(pinyinCount: Int) {
		var results = [[String]]()

		for i in oftenUsedCharacters.characters {
			let character = String(i) as NSString
			if let pinyins = character.toPinyinArray() as? [String] {
				if pinyins.count == pinyinCount {
					var result = pinyins
					result.insert(String(character), atIndex: 0)
					results.append(result)
				}
			}
		}

		print(results)
	}

}