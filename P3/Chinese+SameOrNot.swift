//
//  Chinese+SameOrDifferent.swift
//  P3
//
//  Created by 文川术 on 2/9/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {

	mutating func getOneForSameOrNot() {

		func differentCharactersOrWords() -> [String] {
			var couple = [String]()
			let characterOrWord = getRandomNumbers(1, lessThan: 2)

			if characterOrWord[0] == 0 {
				let index = getRandomNumbers(1, lessThan: pinyins.confusablePinyin_Different.count)[0]
				let differentPinyins = pinyins.confusablePinyin_Different[index].components(separatedBy: " ")

				let indexs_1 = getRandomNumbers(2, lessThan: differentPinyins.count)

				couple.append(differentPinyins[indexs_1[0]])
				let pinyins_1_0 = charactersFromPinyin(couple[0])
				let random_1_0 = getRandomNumbers(1, lessThan: pinyins_1_0.count)[0]
				couple.append(pinyins_1_0[random_1_0])

				couple.append(differentPinyins[indexs_1[1]])
				let pinyins_1_1 = charactersFromPinyin(couple[2])
				let random_1_1 = getRandomNumbers(1, lessThan: pinyins_1_1.count)[0]
				couple.append(pinyins_1_1[random_1_1])
			}


			if characterOrWord[0] == 1 {
				let index = getRandomNumbers(1, lessThan: pinyins.confusablePinyinOfWord_Different.count)[0]
				let differentPinyinOfWords = pinyins.confusablePinyinOfWord_Different[index].components(separatedBy: "-")

				let indexs_1 = getRandomNumbers(2, lessThan: differentPinyinOfWords.count)

				couple.append(differentPinyinOfWords[indexs_1[0]])
				let words_1_0 = wordsFromPinyin(couple[0])
				let random_1_0 = getRandomNumbers(1, lessThan: words_1_0.count)[0]
				couple.append(words_1_0[random_1_0])

				couple.append(differentPinyinOfWords[indexs_1[1]])
				let words_1_1 = wordsFromPinyin(couple[2])
				let random_1_1 = getRandomNumbers(1, lessThan: words_1_1.count)[0]
				couple.append(words_1_1[random_1_1])

			}

			return couple
		}


		func sameCharactersOrWords() -> [String] {
			var couple = [String]()
			let characterOrWord = getRandomNumbers(1, lessThan: 2)[0]

			if characterOrWord == 0 {
				let pinyins = pinyinsWithSeveralCharacters(2, index: 0)
				let index = getRandomNumbers(1, lessThan: pinyins.count)[0]
				let pinyin = pinyins[index]
				let charcters = charactersFromPinyin(pinyin)

				couple.append(pinyin)
				let randomIndex = getRandomNumbers(2, lessThan: charcters.count)
				randomIndex.forEach({ couple.append(charcters[$0]) })
			}

			if characterOrWord == 1 {
				repeat {
					let randomIndex = getRandomNumbers(1, lessThan: 52936)[0]
					let pinyin = wordPinyinFromIndex(Double(randomIndex))
					let words = wordsFromPinyin(pinyin)

					if words.count >= 2 {
						couple.append(pinyin)
						let randomIndexes = getRandomNumbers(2, lessThan: words.count)
						randomIndexes.forEach({ couple.append(words[$0]) })
					}
					
				} while couple.count < 3
				
				
			}
			
			return couple
		}

		forSameOrNot.removeAll()
		
		let sameOrNot = getRandomNumbers(1, lessThan: 2)[0]
		let oneForSameOrNot = sameOrNot == 0 ? sameCharactersOrWords() : differentCharactersOrWords()

		if oneForSameOrNot.count == 3 {
			var text_0 = [String]()
			text_0.append(oneForSameOrNot[0])
			text_0.append(oneForSameOrNot[1])
			forSameOrNot.append(text_0)

			var text_1 = [String]()
			text_1.append(oneForSameOrNot[0])
			text_1.append(oneForSameOrNot[2])
			forSameOrNot.append(text_1)

		} else if oneForSameOrNot.count == 4 {
			var text_0 = [String]()
			text_0.append(oneForSameOrNot[0])
			text_0.append(oneForSameOrNot[1])
			forSameOrNot.append(text_0)

			var text_1 = [String]()
			text_1.append(oneForSameOrNot[2])
			text_1.append(oneForSameOrNot[3])
			forSameOrNot.append(text_1)
			
		}

	}


}
