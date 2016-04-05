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



public protocol BlockViewDelegate: class {
	func blockViewSelected(selected: Bool, blockText: [String])
	func answerShowedByQuestionMark()
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
	var questionMarkVisble = false

	var pinyinShowedIndexs = [Int]()

	weak var delegate: BlockViewDelegate?

	init(type: TestType, origin: CGPoint, text: [String]) {
		self.text = text

		let blockSize = CGSize(width: type.blockWidth, height: type.blockWidth)
		super.init(frame: CGRect(origin: origin, size: blockSize))

		backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
		addColorfulView(text)
		addLabels(text)

		if type == .SelectTheSame { addButton() }
		if type == .Spell { addButtonForColorView() }
	}

	func addColorfulView(text: [String]) {
		let amount = text[1].characters.count
		let viewSize = CGSize(width: self.frame.width / CGFloat(amount), height: self.frame.height)

		for i in 0..<amount {
			let viewOrigin = CGPoint(x: viewSize.width * CGFloat(i), y: 0)
			let view = UIView(frame: CGRect(origin: viewOrigin, size: viewSize))
			view.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
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
			textLabel.font = UIFont.systemFontOfSize(autoFontSize()[0])
			textLabel.textAlignment = .Center
			textLabel.text = letters[i]
			textLabel.adjustsFontSizeToFitWidth = true
			textLabels.append(textLabel)

			let pinyinLabelOrigin = CGPoint(x: labelSize.width * CGFloat(i), y: yPositions[1])
			let pinyinLabel = UILabel(frame: CGRect(origin: pinyinLabelOrigin, size: labelSize))
			pinyinLabel.textColor = UIColor.whiteColor()
			pinyinLabel.font = UIFont.systemFontOfSize(autoFontSize()[1])
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
			addSubview(pinyinLabel)
		}
	}

	func autoFontSize() -> [CGFloat] {
		switch ScreenHeight {
		case 480, 568: return [21, 19]
		case  667: return [21, 19]
		case 736: return [22, 20]
		default: return [21, 19]
		}
	}

	func addButton() {
		button = UIButton(frame: self.bounds)
		button.backgroundColor = UIColor.clearColor()
		button.addTarget(self, action: #selector(selected(_:)), forControlEvents: .TouchUpInside)
		addSubview(button)
	}

	func addButtonForColorView() {
		let button = UIButton(frame: bounds)
		button.addTarget(self, action: #selector(colorViewTapped), forControlEvents: .TouchUpInside)
		button.tag = 77
		addSubview(button)
	}

	func colorViewTapped() {
		if !questionMarkVisble {
			questionMarkVisble = true
			addQuestionButton()
		} else {
			questionMarkVisble = false
			removeQustionButton()
		}
	}

	// MARK: - Question Mark

	func addQuestionButton() {
		let button = UIButton(type: .System)
		button.frame.size = CGSize(width: 40, height: 40)
		button.center = CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds))
		button.backgroundColor = UIColor.colorWithValues(MyColors.P_gold)
		button.tintColor = UIColor.whiteColor()
		button.setTitle("?", forState: .Normal)
		button.titleLabel?.font = UIFont.systemFontOfSize(25)
		button.exclusiveTouch = true
		button.tag = 777
		addSubview(button)

		button.addTarget(self, action: #selector(showAnwser(_:)), forControlEvents: .TouchUpInside)
		button.viewAddAnimation(.BecomeVisble, delay: 0.0, distance: 0.0)
		UIView.animateWithDuration(0.5, animations: { () -> Void in
			self.changeSubViewsAlpha(0.3)
			}, completion: nil)
	}

	func removeQustionButton() {
		if let view = self.viewWithTag(777) {
			UIView.animateWithDuration(0.5, animations: { () -> Void in
				view.alpha = 0.0
				self.changeSubViewsAlpha(1.0)
				}, completion: { (_) -> Void in
					view.removeFromSuperview()
			})
		}
	}

	func showAnwser(sender: UIButton) {
		sender.removeFromSuperview()

		if let view = self.viewWithTag(77) {
			view.removeFromSuperview()
		}

		UIView.animateWithDuration(0.5, animations: { () -> Void in
			self.changeSubViewsAlpha(1.0)
			}, completion: nil)

		for i in 0..<colorfulViews.count {
			changeColorAtIndex(i, color: UIColor.colorWithValues(MyColors.P_blue), backToBlue: false)
			showPinyinAtIndex(i)
		}

		delegate?.answerShowedByQuestionMark()
	}

	func changeSubViewsAlpha(alpha: CGFloat) {
		for colorView in colorfulViews { colorView.alpha = alpha }
		for textLabel in textLabels { textLabel.alpha = alpha }
	}

	// MARK:

	func selected(sender: UIButton) {

		if !selected {
			selected = true
			sender.layer.borderWidth = 2.0
			sender.layer.borderColor = UIColor.whiteColor().CGColor
		} else {
			selected = false
			sender.layer.borderWidth = 0.0
		}

		delegate?.blockViewSelected(selected, blockText: text)
	}

	func showGreenBorder() {
		button.layer.borderWidth = 2.5
		button.layer.borderColor = UIColor.colorWithValues(MyColors.P_rightGreen).CGColor
	}

	func allShowPinyin() {

		if !pinyinVisble {
			pinyinVisble = true

			for i in 0..<textLabels.count {
				showPinyinAtIndex(i)
			}

		}

	}

	func showPinyinAtIndex(index: Int) {
		if let _ = pinyinShowedIndexs.indexOf(index) {

		} else {
			pinyinShowedIndexs.append(index)

			UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { () -> Void in
				self.textLabels[index].frame.origin.y -= self.frame.height / 5
				}, completion: nil)

			UIView.animateWithDuration(0.3, delay: 0.07, options: [], animations: { () -> Void in
				self.pinyinLabels[index].alpha = 1.0
				self.pinyinLabels[index].frame.origin.y -= self.frame.height / 4
				}, completion: nil)
		}

	}

	func allChangeColor(color: UIColor) {

		for i in 0..<colorfulViews.count {
			changeColorAtIndex(i, color: color, backToBlue: true)
		}

	}

	func changeColorAtIndex(index: Int, color: UIColor, backToBlue: Bool) {
		colorfulViews[index].backgroundColor = color

		if color == UIColor.whiteColor() {
			textLabels[index].textColor = UIColor.colorWithValues(MyColors.P_darkBlue)
			pinyinLabels[index].textColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		} else {
			textLabels[index].textColor = UIColor.whiteColor()
			pinyinLabels[index].textColor = UIColor.whiteColor()
		}

		if backToBlue {
			delay(seconds: 0.5) { () -> () in
				self.textLabels[index].textColor = UIColor.whiteColor()
				self.pinyinLabels[index].textColor = UIColor.whiteColor()
				self.colorfulViews[index].backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
			}
		}

	}

	func setSelectable(canSelect: Bool) {
		button.userInteractionEnabled = canSelect

		if let button = viewWithTag(77) as? UIButton {
			button.userInteractionEnabled = canSelect
		}
	}



	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}