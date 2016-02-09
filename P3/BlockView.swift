//
//  BlockView.swift
//  P3
//
//  Created by 文川术 on 2/9/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

enum TestType {
	case Homepage, SameOrNot, SelectTheSame, Spell
}

class BlockView: UIView {

	var text: [String]!

	var colorfulViews = [UIView]()
	var textLabels = [UILabel]()
	var pinyinLabels = [UILabel]()

	init(type: TestType, origin: CGPoint, text: [String]) {

		switch type {
		case .SameOrNot:
			let blockSize = CGSize(width: (ScreenWidth - 60) / 2, height: (ScreenWidth - 60) / 2)
			super.init(frame: CGRect(origin: origin, size: blockSize))
		default:
			super.init(frame: CGRect(origin: origin, size: CGSize.zero))
		}

		self.backgroundColor = UIColor.themeBlue()

		self.text = text

		addColorfulView(text)
		addLabels(text)
	}

	func addColorfulView(text: [String]) {
		let amount = text[1].characters.count
		let viewSize = CGSize(width: self.frame.width / CGFloat(amount), height: self.frame.height)

		for i in 0..<amount {
			let viewOrigin = CGPoint(x: viewSize.width * CGFloat(i), y: 0)
			let view = UIView(frame: CGRect(origin: viewOrigin, size: viewSize))
			view.backgroundColor = UIColor.themeBlue()
			colorfulViews.append(view)
		}

		for view in colorfulViews {
			self.addSubview(view)
		}
	}

	func addLabels(text: [String]) {
		print(text)
		var pinyins = [String]()
		if text[1].characters.count == 1 {
			pinyins.append(text[0])
		} else {
			pinyins = text[0].componentsSeparatedByString(" ")
		}


		var letters = [String]()
		for letter in text[1].characters {
			letters.append(String(letter))
		}


		let amount = text[1].characters.count
		print(amount)
		let labelSize = CGSize(width: self.frame.width / CGFloat(amount), height: self.frame.height / 2)

		for i in 0..<amount {

			let textLabelOrigin = CGPoint(x: labelSize.width * CGFloat(i), y: self.frame.height / 4)
			let textLabel = UILabel(frame: CGRect(origin: textLabelOrigin, size: labelSize))
			textLabel.textColor = UIColor.whiteColor()
			textLabel.font = UIFont.systemFontOfSize(20)
			textLabel.textAlignment = .Center
			textLabel.text = letters[i]
			textLabels.append(textLabel)

			let pinyinLabelOrigin = CGPoint(x: labelSize.width * CGFloat(i), y: textLabelOrigin.y + labelSize.height)
			let pinyinLabel = UILabel(frame: CGRect(origin: pinyinLabelOrigin, size: labelSize))
			pinyinLabel.textColor = UIColor.whiteColor()
			pinyinLabel.font = UIFont.systemFontOfSize(18)
			pinyinLabel.textAlignment = .Center
			pinyinLabel.text = pinyins[i]
			pinyinLabels.append(pinyinLabel)
		}

		for textLabel in textLabels {
			self.addSubview(textLabel)
		}

		for pinyinLabel in pinyinLabels {
			pinyinLabel.alpha = 0.0
			self.addSubview(pinyinLabel)
		}
	}

	func showPinyin() {

		UIView.animateWithDuration(0.5) { () -> Void in
			for textLabel in self.textLabels {
				textLabel.frame.origin.y -= self.frame.height / 4
			}

			for pinyinLabel in self.pinyinLabels {
				pinyinLabel.alpha = 1.0
				pinyinLabel.frame.origin.y -= self.frame.height / 4
			}
		}

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}