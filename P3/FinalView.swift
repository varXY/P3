//
//  FinalView.swift
//  P3
//
//  Created by 文川术 on 2/14/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit


protocol FinalViewDelegate: class {
	func finalViewButtonTapped(_ buttonType: FinalViewButtonType)
}

enum FinalViewButtonType {
	case again, quit
}

class FinalView: UIView {

	var titleLabel: UILabel!
	var numberLabel: UILabel!
	var bottomLabel: UILabel!

	weak var delegate: FinalViewDelegate?

	init() {
		super.init(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ScreenHeight - 60))
		self.backgroundColor = UIColor.white

		titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
		titleLabel.textAlignment = .center
		titleLabel.font = UIFont.systemFont(ofSize: 20)
		addSubview(titleLabel)

		numberLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.height - 20, width: frame.width, height: frame.height - 160 - 60 - 50))
		numberLabel.textColor = UIColor.colorWithValues(MyColors.P_gold)
		numberLabel.textAlignment = .center
		numberLabel.font = UIFont.scoreFont(90)
		addSubview(numberLabel)

		let indexes = [0, 1]
		let _: [UIButton] = indexes.map({
			let button = UIButton(type: .system)
			button.frame = CGRect(x: 20, y: (self.frame.height - 160 - 60) + 80 * CGFloat($0), width: self.frame.width - 40, height: 60)
			button.backgroundColor = UIColor.clear
			button.addTextLabel(Titles.finalChoices[$0], textColor: UIColor.colorWithValues(MyColors.P_darkBlue), font: UIFont.systemFont(ofSize: 22), animated: false)
			button.changeColorWhenTouchDown(UIColor.colorWithValues(MyColors.P_darkBlue))
			button.addBorder(borderColor: UIColor.colorWithValues(MyColors.P_darkBlue), width: 2.0)
			button.tag = 9999 + $0
			button.addTarget(self, action: #selector(finalChoice(_:)), for: .touchUpInside)
			button.isExclusiveTouch = true
			addSubview(button)
			return button
		})

		bottomLabel = UILabel(frame: CGRect(x: 0, y: frame.height - 60, width: frame.width, height: 60))
		bottomLabel.textColor =  UIColor.white
		bottomLabel.font = UIFont.systemFont(ofSize: 22)
		bottomLabel.textAlignment = .center
		bottomLabel.backgroundColor = UIColor.colorWithValues(MyColors.P_gold)
		addSubview(bottomLabel)
	}

	func show(_ currentScore: Int, delay: Double) {
		let win = currentScore >= 0
		let numberToShow = win ? currentScore : -currentScore
		titleLabel.textColor = win ? UIColor.colorWithValues(MyColors.P_rightGreen) : UIColor.colorWithValues(MyColors.P_wrongRed)
		titleLabel.text = win ? NSLocalizedString("You win:", comment: "FinalView") : NSLocalizedString("You lose:", comment: "FinalView")
		numberLabel.text = "\(numberToShow)"

		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm MM-dd-yyyy"
		bottomLabel.text = formatter.string(from: Date())
		
		UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.frame.origin.y -= self.frame.height
			}, completion: nil)

	}

	func finalChoice(_ sender: UIButton) {

		UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.frame.origin.y += self.frame.height
			}) { (_) -> Void in
				let buttonType = sender.tag == 9999 ? FinalViewButtonType.again : FinalViewButtonType.quit
				self.delegate?.finalViewButtonTapped(buttonType)
		}

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}
