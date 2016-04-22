//
//  Chinese+SelectTheSame.swift
//  P3
//
//  Created by 文川术 on 2/10/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {

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

		if let index = pinyins.indexOf(pinyins[index]) {
			pinyins.removeAtIndex(index)
			pinyins.forEach({
				let words = charactersFromPinyin($0)
				let randomOne = getRandomNumbers(1, lessThan: words.count)[0]
				forSelectTheSame.append([$0, words[randomOne]])
			})

		}
	}


}



