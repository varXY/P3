//
//  Chinese+SelectTheSame.swift
//  P3
//
//  Created by 文川术 on 2/10/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {

	mutating func get60CharactersForSelectTheSame() {
		let all = pinyinsWithSeveralCharacters(2, index: 0)
		let indexes = getRandomNumbers(30, lessThan: all.count)
		let selectedPinyins = all.filter({ indexes.contains(all.index(of: $0)!) })
		let selectedCharacters: [[String]] = selectedPinyins.map({
			let charcacters = charactersFromPinyin($0)
			let indexes = getRandomNumbers(2, lessThan: charcacters.count)
			return charcacters.filter({ indexes.contains(charcacters.index(of: $0)!) })
		})

		var characters_60 = [String]()
		var pinyins_60 = [String]()

		var i = 0
		repeat {
			characters_60.append(selectedCharacters[i][0])
			characters_60.append(selectedCharacters[i][1])

			pinyins_60.append(selectedPinyins[i])
			pinyins_60.append(selectedPinyins[i])

			i += 1
		} while i < selectedCharacters.count

		let randomIndexes = getRandomNumbers(60, lessThan: 60)
		selectTheSame60Characters = randomIndexes.map({ characters_60[$0] })
		selectTheSame60Pinyins = randomIndexes.map({ pinyins_60[$0] })

	}

	mutating func getSixForSelectTheSame() {
		func coupleOfConfusablePinyin() -> [String] {
			var results = [String]()
			let one = getRandomNumbers(1, lessThan: 23)[0]
			let all = pinyinsWithSeveralCharacters(3, index: one) // all 的数量必须大于等于4
			let numbers = getRandomNumbers(4, lessThan: all.count)
			numbers.forEach({ results.append(all[$0]) })
			return results
		}

		forSelectTheSame.removeAll()

		var pinyins = coupleOfConfusablePinyin()
		let index = getRandomNumbers(1, lessThan: pinyins.count)[0]
		let words = charactersFromPinyin(pinyins[index])
		let three = getRandomNumbers(3, lessThan: words.count)

		three.forEach({ forSelectTheSame.append([pinyins[index], words[$0]]) })

		if let index = pinyins.index(of: pinyins[index]) {
			pinyins.remove(at: index)
			pinyins.forEach({
				let words = charactersFromPinyin($0)
				let randomOne = getRandomNumbers(1, lessThan: words.count)[0]
				forSelectTheSame.append([$0, words[randomOne]])
			})

		}
	}


}



