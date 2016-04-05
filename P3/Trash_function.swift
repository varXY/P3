//
//  Trash_function.swift
//  P3
//
//  Created by 文川术 on 2/15/16.
//  Copyright © 2016 myname. All rights reserved.
//


//enum ColorType {
//	case Blue, White, Red, Green, Gold
//
//	var color: UIColor {
//		switch self {
//		case .Blue: return UIColor.colorWithValues(MyColors.P_blue)
//		case .White: return UIColor.whiteColor()
//		case .Red: return UIColor.colorWithValues(MyColors.P_wrongRed)
//		case .Green: return UIColor.colorWithValues(MyColors.P_rightGreen)
//		case .Gold: return UIColor.colorWithValues(MyColors.P_gold)
//		}
//	}
//}

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


//	func changeLabels(text: [String]) {
//
//		for textLabel in textLabels {
//			textLabel.removeFromSuperview()
//		}
//
//		for pinyinLabel in pinyinLabels {
//			pinyinLabel.removeFromSuperview()
//		}
//		textLabels.removeAll()
//		pinyinLabels.removeAll()
//
//		handleText(text)
//		genLabels(letters.count, hidePinyin: false)
//		colorForHomepage()
//
//	}

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
//		let attributes = [NSForegroundColorAttributeName: UIColor.colorWithValues(MyColors.P_gold), NSFontAttributeName: UIFont.pickerFont(20)]
//		let title = NSAttributedString(string: string, attributes: attributes)
//		return title
//	}



//pageLabel = UILabel(frame: CGRect(x: (self.frame.width - 100) / 2, y: 15, width: 100, height: height))
//pageLabel.textColor = UIColor.whiteColor()
//pageLabel.textAlignment = .Center
//pageLabel.font = UIFont.systemFontOfSize(18)
//pageLabel.text = "\(page) / 10"
//self.addSubview(pageLabel)


