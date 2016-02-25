//
//  Trash_function.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//

//func charactersFromPinyin(pinyin: String) -> [String] {
//	var results = [String]()
//
//	for i in oftenUsedCharacters.characters {
//		let value = String(i) as NSString
//		if let all = value.toPinyinArray() as? [String] {
//			if let _ = all.indexOf(pinyin) {
//				results.append(value as String)
//			}
//		}
//	}
//
//	return results
//}


//	func randomPinyinOfWord() -> String {
//		let AOrB = arc4random_uniform(10)
//		let amount = AOrB == 2 ? 3 : 2
//		let randomNumubers = getRandomNumbers(amount, lessThan: allPossiblePinyin.count)
//
//		var pinyin = String()
//		for i in randomNumubers {
//			if pinyin.characters.count == 0 {
//				pinyin += allPossiblePinyin[i]
//			} else {
//				pinyin += " " + allPossiblePinyin[i]
//			}
//
//		}
//
//		return pinyin
//	}

//func getSixForSelectTheSame(complete: () -> Void) {
//	sixPinyinAndCharacters()
//	complete()
//}
//
//func sixPinyinAndCharacters() {
//	forSelectTheSame.removeAll()
//
//	var pinyins = coupleOfconfusablePinyin()
//
//
//	var sameWords = [String]()
//
//	repeat {
//		let index = getRandomNumbers(1, lessThan: pinyins.count)
//
//		let words = charactersFromPinyin(pinyins[index[0]])
//
//		if words.count >= 3 {
//			sameWords = numberOfWords(3, words: words)
//
//			for i in 0..<3 {
//				var block = [pinyins[index[0]]]
//				block.append(sameWords[i])
//				forSelectTheSame.append(block)
//			}
//
//			if let index = pinyins.indexOf(pinyins[index[0]]) {
//				pinyins.removeAtIndex(index)
//
//				for pinyin in pinyins {
//					let words = charactersFromPinyin(pinyin)
//
//					var block = [pinyin]
//					block.append(numberOfWords(1, words: words)[0])
//					forSelectTheSame.append(block)
//				}
//			}
//
//		}
//	} while sameWords.count < 3
//
//}
//
//func numberOfWords(number: Int, words: [String]) -> [String] {
//	var resultWords = [String]()
//
//	let indexs = getRandomNumbers(number, lessThan: words.count)
//
//	for i in 0..<indexs.count {
//		resultWords.append(words[indexs[i]])
//	}
//
//	return resultWords
//}
//
//func coupleOfconfusablePinyin() -> [String] {
//	var allFour = [String]()
//
//	let indexs = getRandomNumbers(2, lessThan: confusablePinyin_Different.count)
//
//	let two_0 = confusablePinyin_Different[indexs[0]].componentsSeparatedByString(" ")
//	let two_1 = confusablePinyin_Different[indexs[1]].componentsSeparatedByString(" ")
//
//	for i in 0..<2 {
//		allFour.append(two_0[i])
//		allFour.append(two_1[i])
//	}
//
//	return allFour
//}

//	func addTimer() {
//		timer =  NSTimer(timeInterval: 2.0, target: self, selector: "countDown", userInfo: nil, repeats: true)
//		NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
//	}

//func homepageChanging(text: [String]) {
//
//	UIView.animateWithDuration(1.5, animations: { () -> Void in
//
//		for textLabel in self.textLabels { textLabel.alpha = 0.0 }
//		for pinyinLabel in self.pinyinLabels { pinyinLabel.alpha = 0.0 }
//
//		}) { (_) -> Void in
//
//			self.changeLabels(text)
//	}
//
//	delay(seconds: 2.5) { () -> () in
//
//		UIView.animateWithDuration(1.5, animations: { () -> Void in
//
//			for textLabel in self.textLabels { textLabel.alpha = 1.0 }
//			for pinyinLabel in self.pinyinLabels { pinyinLabel.alpha = 1.0 }
//
//			}, completion: nil)
//
//	}
//	
//}


//	func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//		let string = component_allTitles[component][row]
//		let attributes = [NSForegroundColorAttributeName: UIColor.themeGold(), NSFontAttributeName: UIFont.pickerFont(20)]
//		let title = NSAttributedString(string: string, attributes: attributes)
//		return title
//	}


//func confirm() {
//
//	if !answerShowed {
//		answerShowed = true
//		showRightOrWrong()
//
//		delay(seconds: 0.7, completion: {
//			self.currentPage++
//			self.addContent(page: self.currentPage, firstTime: false)
//		})
//
//	} else {
//		answerShowed = false
//
//		if currentPage != 10 {
//			headerView.changeNumber(toNumber: currentPage + 1)
//			jumpToPage(currentPage)
//		}
//
//	}
//
//}

//pageLabel = UILabel(frame: CGRect(x: (self.frame.width - 100) / 2, y: 15, width: 100, height: height))
//pageLabel.textColor = UIColor.whiteColor()
//pageLabel.textAlignment = .Center
//pageLabel.font = UIFont.systemFontOfSize(18)
//pageLabel.text = "\(page) / 10"
//self.addSubview(pageLabel)

//func removeThreeMainButtons() {
//	for i in 0..<3 {
//		if let button = self.view.viewWithTag(10 + i) {
//			button.removeFromSuperview()
//		}
//	}
//}

//	func addBlockView() {
//		chinese.getOneForSpell()
//
//		let point = CGPoint(x: (ScreenWidth - BlockWidth.homepage) / 2, y: (ScreenHeight / 2 - BlockWidth.homepage) / 2)
//		blockView = BlockView(type: .Homepage, origin: point, text: chinese.forSpell)
//		self.view.addSubview(blockView)
//
//		let timer = NSTimer(timeInterval: 5.0, target: self, selector: "blockViewChangeContent", userInfo: nil, repeats: true)
//		NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
//	}


//	func blockViewChangeContent() {
//		chinese.getOneForSpell()
//		blockView.homepageChanging(chinese.forSpell)
//	}


//	func addNextButton() {
//
//		let button = UIButton(type: .System)
//		button.frame = CGRect(x: 40, y: self.view.frame.height, width: self.view.frame.width - 80, height: 50)
//		button.backgroundColor = UIColor.whiteColor()
//		button.setTitle("Next", forState: .Normal)
//		self.view.addSubview(button)
//
//		UIView.animateWithDuration(0.5, animations: { () -> Void in
//			button.frame.origin.y -= 70
//
//			}) { (_) -> Void in
//				button.addTarget(self, action: "next:", forControlEvents: .TouchUpInside)
//		}
//
//	}

//	func next(sender: UIButton) {
//
//		UIView.animateWithDuration(0.5, animations: { () -> Void in
//			sender.frame.origin.y += 70
//		})
//
//		if self.currentPage <= 9 {
//			delay(seconds: 0.5, completion: { () -> () in
//				self.titleLabel.text = "\(self.currentPage + 1)/10"
//				self.jumpToPage(self.currentPage)
//			})
//		} else {
//			self.titleLabel.text = "complete"
//			delay(seconds: 2.0, completion: { () -> () in
//				self.scrollView.removeFromSuperview()
//				self.picker.alpha = 0.0
//				self.prepareScrollView(firstTime: false)
//			})
//
//			delay(seconds: 3.0, completion: { () -> () in
//				self.addCompletedPage()
//			})
//		}
//
//	}


//	func addCompletedPage() {
//		let contentView = UIView(frame: CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60))
//		contentView.backgroundColor = UIColor.clearColor()
//		contentView.tag = 110
//		self.view.addSubview(contentView)
//
//		let resultLabel = UILabel(frame: CGRect(x: 0, y: 60, width: contentView.frame.width, height: 60))
//		resultLabel.textAlignment = .Center
//		resultLabel.textColor = UIColor.whiteColor()
//		resultLabel.font = UIFont.boldSystemFontOfSize(22)
////		resultLabel.text = "共答对了\(rightCount)题"
//		contentView.addSubview(resultLabel)
//
//		let titles = ["Again", "Quit"]
//
//		for i in 0..<2 {
//			let button = UIButton(type: .System)
//			button.frame = CGRect(x: 20, y: (contentView.frame.height - 160) + 80 * CGFloat(i), width: contentView.frame.width - 40, height: 60)
//			button.backgroundColor = UIColor.whiteColor()
//			button.setTitle(titles[i], forState: .Normal)
//			button.addTarget(self, action: "finalChoice:", forControlEvents: .TouchUpInside)
//			button.exclusiveTouch = true
//			button.tag = 120 + i
//			contentView.addSubview(button)
//		}
//
//
//	}
//
//
//	func finalChoice(sender: UIButton) {
//		let again = sender.tag == 120
//
//		if again {
//			self.titleLabel.text = "1/10"
//			self.rightCount = 0
//
//			if let contentView = self.view.viewWithTag(110) {
//
//				UIView.animateWithDuration(0.4, animations: { () -> Void in
//					contentView.alpha = 0.0
//					self.scrollView.frame.origin.x -= self.view.frame.width
//					self.picker.alpha = 1.0
//					}, completion: { (_) -> Void in
//						contentView.removeFromSuperview()
//				})
//
//			}
//
//		} else {
//			confirmToQuit()
//		}
//	}