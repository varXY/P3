//
//  Chinese+SelectTheSame.swift
//  P3
//
//  Created by 文川术 on 2/10/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {


	func sixPinyinAndCharacters() {
		forSelectTheSame.removeAll()

		var pinyins = coupleOfconfusablePinyin()


		var sameWords = [String]()

		repeat {
			let index = getRandomNumbers(1, lessThan: pinyins.count)

			let words = charactersFromPinyin(pinyins[index[0]])

			if words.count >= 3 {
				sameWords = numberOfWords(3, words: words)

				for i in 0..<3 {
					var block = [pinyins[index[0]]]
					block.append(sameWords[i])
					forSelectTheSame.append(block)
				}

				if let index = pinyins.indexOf(pinyins[index[0]]) {
					pinyins.removeAtIndex(index)

					for pinyin in pinyins {
						let words = charactersFromPinyin(pinyin)

						var block = [pinyin]
						block.append(numberOfWords(1, words: words)[0])
						forSelectTheSame.append(block)
					}
				}

			}
		} while sameWords.count < 3


	}

	func numberOfWords(number: Int, words: [String]) -> [String] {
		var resultWords = [String]()

		let indexs = getRandomNumbers(number, lessThan: words.count)

		for i in 0..<indexs.count {
			resultWords.append(words[indexs[i]])
		}

		return resultWords
	}

	func coupleOfconfusablePinyin() -> [String] {
		var allFour = [String]()

		let indexs = getRandomNumbers(2, lessThan: confusablePinyin_Different.count)

		let two_0 = confusablePinyin_Different[indexs[0]].componentsSeparatedByString(" ")
		let two_1 = confusablePinyin_Different[indexs[1]].componentsSeparatedByString(" ")

		for i in 0..<2 {
			allFour.append(two_0[i])
			allFour.append(two_1[i])
		}

		return allFour
	}
}