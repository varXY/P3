//
//  BlockView.swift
//  P3
//
//  Created by 文川术 on 2/9/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit

enum TestType {
	case homepage, sameOrNot, selectTheSame, spell

	var blockWidth: CGFloat {
		switch self {
		case .homepage: return BlockWidth.homepage
		case .sameOrNot: return BlockWidth.sameOrNot
		case .selectTheSame: return BlockWidth.selectTheSame
		case .spell: return BlockWidth.spell
		}
	}
}

public protocol BlockViewDelegate: class {
	func blockViewSelected(_ selected: Bool, blockText: [String])
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

		if type == .selectTheSame { addButton() }
		if type == .spell { addButtonForColorView() }
	}

    
	func addColorfulView(_ text: [String]) {
		let strings = text[1].characters.map({ String($0) })
		let viewSize = CGSize(width: self.frame.width / CGFloat(strings.count), height: self.frame.height)

		colorfulViews = strings.map({
			let viewOrigin = CGPoint(x: viewSize.width * CGFloat(strings.index(of: $0)!), y: 0)
			let view = UIView(frame: CGRect(origin: viewOrigin, size: viewSize))
			view.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
			addSubview(view)
			return view
		})

	}

    
	func addLabels(_ text: [String]) {
		handleText(text)
		genLabels(letters.count, hidePinyin: true)
	}

    
	func handleText(_ text: [String]) {
		pinyins.removeAll()
		letters.removeAll()

		pinyins = text[1].characters.count == 1 ? pinyins + [text[0]] : text[0].components(separatedBy: " ")
		text[1].characters.forEach({ letters.append(String($0)) })

	}

    
	func genLabels(_ amount: Int, hidePinyin: Bool) {
		let labelSize = CGSize(width: frame.width / CGFloat(amount), height: frame.height / 2)
		let yPositions = hidePinyin ? [frame.height / 4, frame.height / 4 + labelSize.height] : [frame.height / 20, labelSize.height]
//		let indexes = getIndexArrayFromAmount(amount)

		textLabels = (0..<amount).map({
			let textLabelOrigin = CGPoint(x: labelSize.width * CGFloat($0), y: yPositions[0])
			let textLabel = UILabel(frame: CGRect(origin: textLabelOrigin, size: labelSize))
			textLabel.textColor = UIColor.white
			textLabel.font = UIFont.systemFont(ofSize: autoFontSize()[0])
			textLabel.textAlignment = .center
			textLabel.text = letters[$0]
			textLabel.adjustsFontSizeToFitWidth = true
			textLabel.alpha = hidePinyin ? 1.0 : 0.0
			addSubview(textLabel)
			return textLabel
		})

        
		pinyinLabels = (0..<amount).map({
			let pinyinLabelOrigin = CGPoint(x: labelSize.width * CGFloat($0), y: yPositions[1])
			let pinyinLabel = UILabel(frame: CGRect(origin: pinyinLabelOrigin, size: labelSize))
			pinyinLabel.textColor = UIColor.white
			pinyinLabel.font = UIFont.systemFont(ofSize: autoFontSize()[1])
			pinyinLabel.textAlignment = .center
			pinyinLabel.text = pinyins[$0]
			pinyinLabel.adjustsFontSizeToFitWidth = true
			pinyinLabel.alpha = 0.0
			addSubview(pinyinLabel)
			return pinyinLabel
		})

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
		button.backgroundColor = UIColor.clear
		button.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
		addSubview(button)
	}

	func addButtonForColorView() {
		let button = UIButton(frame: bounds)
		button.addTarget(self, action: #selector(colorViewTapped), for: .touchUpInside)
		button.tag = 77
		addSubview(button)
	}

	func colorViewTapped() {
		questionMarkVisble = !questionMarkVisble
		questionMarkVisble ? addQuestionButton() : removeQustionButton()
	}

	// MARK: - Question Mark

	func addQuestionButton() {
		let button = UIButton(type: .system)
		button.frame.size = CGSize(width: 40, height: 40)
		button.center = CGPoint(x: bounds.midX, y: bounds.midY)
		button.backgroundColor = UIColor.colorWithValues(MyColors.P_gold)
		button.tintColor = UIColor.white
		button.setTitle("?", for: UIControlState())
		button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
		button.isExclusiveTouch = true
		button.tag = 777
		addSubview(button)

		button.addTarget(self, action: #selector(showAnwser(_:)), for: .touchUpInside)
		button.viewAddAnimation(.becomeVisble, delay: 0.0, distance: 0.0)
		UIView.animate(withDuration: 0.5, animations: { () -> Void in
			self.changeSubViewsAlpha(0.3)
			}, completion: nil)
	}

	func removeQustionButton() {
		if let view = viewWithTag(777) {
			UIView.animate(withDuration: 0.5, animations: { () -> Void in
				view.alpha = 0.0
				self.changeSubViewsAlpha(1.0)
				}, completion: { (_) -> Void in
					view.removeFromSuperview()
			})
		}
	}

	func showAnwser(_ sender: UIButton) {
		sender.removeFromSuperview()
		if let view = viewWithTag(77) { view.removeFromSuperview() }

		UIView.animate(withDuration: 0.5, animations: { () -> Void in
			self.changeSubViewsAlpha(1.0)
			}, completion: nil)

		colorfulViews.forEach({
			let i = colorfulViews.index(of: $0)!
			changeColorAtIndex(i, color: UIColor.colorWithValues(MyColors.P_blue), backToBlue: false)
			showPinyinAtIndex(i)
		})

		delegate?.answerShowedByQuestionMark()
	}

	func changeSubViewsAlpha(_ alpha: CGFloat) {
		colorfulViews.forEach({ $0.alpha = alpha })
		textLabels.forEach({ $0.alpha = alpha })
	}

	// MARK:

	func selected(_ sender: UIButton) {
		selected = !selected
		selected ? sender.addBorder(borderColor: UIColor.white, width: 2.0) : sender.addBorder(borderColor: UIColor.white, width: 0.0)
		delegate?.blockViewSelected(selected, blockText: text)
	}

	func showGreenBorder() {
		button.layer.borderWidth = 2.5
		button.layer.borderColor = UIColor.colorWithValues(MyColors.P_rightGreen).cgColor
	}

	func allShowPinyin() {
		if !pinyinVisble {
			pinyinVisble = true
			textLabels.forEach({ let i = textLabels.index(of: $0)!; showPinyinAtIndex(i) })
		}
	}

	func showPinyinAtIndex(_ index: Int) {
		if let _ = pinyinShowedIndexs.index(of: index) {

		} else {
			pinyinShowedIndexs.append(index)
            
            var pinyinLabelsMoveDistance = frame.height / 4
            
            if ScreenWidth == 320 {
                pinyinLabels[index].frame.origin.y -= 10
                pinyinLabelsMoveDistance -= 10
            }
            
			UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: { () -> Void in
				self.textLabels[index].frame.origin.y -= self.frame.height / 5
				}, completion: nil)

			UIView.animate(withDuration: 0.3, delay: 0.07, options: [], animations: { () -> Void in
				self.pinyinLabels[index].alpha = 1.0
				self.pinyinLabels[index].frame.origin.y -= pinyinLabelsMoveDistance
				}, completion: nil)
		}

	}

	func allChangeColor(_ color: UIColor) {
		colorfulViews.forEach({ changeColorAtIndex(colorfulViews.index(of: $0)!, color: color, backToBlue: true) })
	}

	func changeColorAtIndex(_ index: Int, color: UIColor, backToBlue: Bool) {
		colorfulViews[index].backgroundColor = color
		let selected = color == UIColor.white
		textLabels[index].textColor = selected ? UIColor.colorWithValues(MyColors.P_darkBlue) : UIColor.white
		pinyinLabels[index].textColor = selected ? UIColor.colorWithValues(MyColors.P_darkBlue) : UIColor.white

		if backToBlue {
			delay(seconds: 0.5) { () -> () in
				self.textLabels[index].textColor = UIColor.white
				self.pinyinLabels[index].textColor = UIColor.white
				self.colorfulViews[index].backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
			}
		}

	}

	func setSelectable(_ canSelect: Bool) {
		button.isUserInteractionEnabled = canSelect
		if let button = viewWithTag(77) as? UIButton { button.isUserInteractionEnabled = canSelect }
	}



	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}
