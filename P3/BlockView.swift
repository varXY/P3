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

	var blockWidth: CGFloat {
		switch self {
		case .Homepage: return BlockWidth.homepage
		case .SameOrNot: return BlockWidth.sameOrNot
		case .SelectTheSame: return BlockWidth.selectTheSame
		case .Spell: return BlockWidth.spell
		}
	}
}

enum ColorType {
	case Blue, White, Red, Green, Gold

	var color: UIColor {
		switch self {
		case .Blue: return UIColor.themeBlue()
		case .White: return UIColor.whiteColor()
		case .Red: return UIColor.wrongRed()
		case .Green: return UIColor.rightGreen()
		case .Gold: return UIColor.themeGold()
		}
	}
}

protocol BlockViewDelegate: class {
	func blockViewSelected(selected: Bool, blockText: [String])
}

class BlockView: UIView {

	var text: [String]!
	var pinyins = [String]()
	var letters = [String]()

	var colorfulViews = [UIView]()
	var textLabels = [UILabel]()
	var pinyinLabels = [UILabel]()
	var button = UIButton()

	var pinyinVisble = false
	var selected = false

	weak var delegate: BlockViewDelegate?

	init(type: TestType, origin: CGPoint, text: [String]) {
		self.text = text

		let blockSize = CGSize(width: type.blockWidth, height: type.blockWidth)
		super.init(frame: CGRect(origin: origin, size: blockSize))
		backgroundColor = UIColor.themeBlue()
//		addBorder()
		addColorfulView(text)
		addLabels(text)

		if type == .Homepage { colorForHomepage(); showAllPinyin() }
		if type == .SelectTheSame { addButton() }
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

		handleText(text)
		genLabels(letters.count, hidePinyin: true)

	}

	func changeLabels(text: [String]) {

		for textLabel in textLabels {
			textLabel.removeFromSuperview()
		}

		for pinyinLabel in pinyinLabels {
			pinyinLabel.removeFromSuperview()
		}
		textLabels.removeAll()
		pinyinLabels.removeAll()

		handleText(text)
		genLabels(letters.count, hidePinyin: false)
		colorForHomepage()

	}

	func handleText(text: [String]) {
		pinyins.removeAll()
		letters.removeAll()

		if text[1].characters.count == 1 {
			pinyins.append(text[0])
		} else {
			pinyins = text[0].componentsSeparatedByString(" ")
		}

		for letter in text[1].characters {
			letters.append(String(letter))
		}

	}

	func genLabels(amount: Int, hidePinyin: Bool) {

		let labelSize = CGSize(width: self.frame.width / CGFloat(amount), height: self.frame.height / 2)

		var yPositions = [CGFloat]()

		if hidePinyin {
			yPositions = [self.frame.height / 4, self.frame.height / 4 + labelSize.height]
		} else {
			yPositions = [ self.frame.height / 20, labelSize.height]
		}

		for i in 0..<amount {

			let textLabelOrigin = CGPoint(x: labelSize.width * CGFloat(i), y: yPositions[0])
			let textLabel = UILabel(frame: CGRect(origin: textLabelOrigin, size: labelSize))
			textLabel.textColor = UIColor.whiteColor()
			textLabel.font = UIFont.systemFontOfSize(20)
			textLabel.textAlignment = .Center
			textLabel.text = letters[i]
			textLabels.append(textLabel)

			let pinyinLabelOrigin = CGPoint(x: labelSize.width * CGFloat(i), y: yPositions[1])
			let pinyinLabel = UILabel(frame: CGRect(origin: pinyinLabelOrigin, size: labelSize))
			pinyinLabel.textColor = UIColor.whiteColor()
			pinyinLabel.font = UIFont.systemFontOfSize(18)
			pinyinLabel.textAlignment = .Center
			pinyinLabel.text = pinyins[i]
			pinyinLabel.adjustsFontSizeToFitWidth = true
			pinyinLabels.append(pinyinLabel)
		}

		for textLabel in textLabels {
			textLabel.alpha = hidePinyin ? 1.0 : 0.0
			self.addSubview(textLabel)
		}

		for pinyinLabel in pinyinLabels {
			pinyinLabel.alpha = 0.0
			self.addSubview(pinyinLabel)
		}
	}

	func addButton() {
		button = UIButton(frame: self.bounds)
		button.backgroundColor = UIColor.clearColor()
		button.addTarget(self, action: "selected:", forControlEvents: .TouchUpInside)
		self.addSubview(button)
	}

	func homepageChanging(text: [String]) {

		UIView.animateWithDuration(1.5, animations: { () -> Void in

			for textLabel in self.textLabels { textLabel.alpha = 0.0 }
			for pinyinLabel in self.pinyinLabels { pinyinLabel.alpha = 0.0 }

			}) { (_) -> Void in

				self.changeLabels(text)
		}

		delay(seconds: 2.5) { () -> () in

			UIView.animateWithDuration(1.5, animations: { () -> Void in

				for textLabel in self.textLabels { textLabel.alpha = 1.0 }
				for pinyinLabel in self.pinyinLabels { pinyinLabel.alpha = 1.0 }

				}, completion: nil)

		}

	}

	func selected(sender: UIButton) {

		if !selected {
			selected = true
			sender.layer.borderWidth = 2.0
			sender.layer.borderColor = ColorType.White.color.CGColor
		} else {
			selected = false
			sender.layer.borderWidth = 0.0
		}

		delegate?.blockViewSelected(selected, blockText: text)
	}

	func showResultAndPinyin(resultColorType: ColorType) {
		for i in 0..<colorfulViews.count {
			changeColor(i, colorType: resultColorType, backToBlue: true)
		}

		delay(seconds: 0.5, completion: { self.showAllPinyin() })
	}

	func showGreenBorder() {
		UIView.animateWithDuration(0.3) { () -> Void in
			self.button.layer.borderWidth = 3.0
			self.button.layer.borderColor = ColorType.Green.color.CGColor
		}
	}

	func showAllPinyin() {

		if !pinyinVisble {
			pinyinVisble = true

			UIView.animateWithDuration(0.3) { () -> Void in
				for textLabel in self.textLabels {
					textLabel.frame.origin.y -= self.frame.height / 5
				}

				for pinyinLabel in self.pinyinLabels {
					pinyinLabel.alpha = 1.0
					pinyinLabel.frame.origin.y -= self.frame.height / 4
				}
			}

		}

	}

	func showPinyinAtIndex(index: Int) {

		UIView.animateWithDuration(0.3) { () -> Void in
			self.textLabels[index].frame.origin.y -= self.frame.height / 5
			self.pinyinLabels[index].alpha = 1.0
			self.pinyinLabels[index].frame.origin.y -= self.frame.height / 4
		}
	}

	func changeColor(index: Int, colorType: ColorType, backToBlue: Bool) {
		colorfulViews[index].backgroundColor = colorType.color

		if colorType.color == UIColor.whiteColor() {
			textLabels[index].textColor = UIColor.deepGray()
			pinyinLabels[index].textColor = UIColor.deepGray()
		} else {
			textLabels[index].textColor = UIColor.whiteColor()
			pinyinLabels[index].textColor = UIColor.whiteColor()
		}

		if backToBlue {
			delay(seconds: 0.5) { () -> () in
				self.textLabels[index].textColor = UIColor.whiteColor()
				self.pinyinLabels[index].textColor = UIColor.whiteColor()
				self.colorfulViews[index].backgroundColor = UIColor.themeBlue()
			}
		}

	}

	func colorForHomepage() {
		for view in colorfulViews { view.backgroundColor = UIColor.whiteColor() }
		for label in textLabels { label.textColor = UIColor.deepGray() }
		for label in pinyinLabels { label.textColor = UIColor.deepGray() }
	}

	func setSelectable(canSelect: Bool) {
		button.userInteractionEnabled = canSelect
	}

	func allChangeColor(colorType: ColorType) {

		for colorView in colorfulViews {
			colorView.backgroundColor = colorType.color
		}

		delay(seconds: 0.5) { () -> () in
			for colorView in self.colorfulViews {
				colorView.backgroundColor = UIColor.themeBlue()
			}
		}

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}