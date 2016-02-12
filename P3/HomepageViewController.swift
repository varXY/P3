//
//  ViewController.swift
//  P3
//
//  Created by Bobo on 1/22/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit
import CoreData

class HomepageViewController: UIViewController {

	let chinese = Chinese()
	var bigButtons = [UIButton]()

	var six = [[String]]()

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		addThreeMainButtons()

		let trash = Trash_1()
		let confusables = [trash.confusableFirstInB, trash.confusableFirstInC, trash.confusableFirstInD, trash.confusableFirstInE, trash.confusableFirstInF, trash.confusableFirstInG]
		let contents = [trash.B, trash.C, trash.D, trash.E, trash.F, trash.G]

		for i in 0..<contents.count {
			let content = contents[i]

			var allA = [String]()
			var allAs = [String]()

			var allB = [String]()
			var allBs = [String]()

			for j in 0..<confusables[i].count {
				let confusable = confusables[i][j]
				let yins = confusable.componentsSeparatedByString("，")
				var a = ""
				var b = ""

				for pinyin in content {
					if let range = pinyin.rangeOfString(yins[0]) {
						a = pinyin
						a.replaceRange(range, with: "")
						allA.append(a)
						allAs.append(pinyin)
						print(a)
					}
				}

				for pinyin in content {
					if let range = pinyin.rangeOfString(yins[1]) {
						b = pinyin
						b.replaceRange(range, with: "")
						allB.append(b)
						allBs.append(pinyin)
						print(b)
					}
				}

			}

			for m in 0..<allA.count {
				if let _ = allB.indexOf(allA[m]) {
					print(confusables[i])
					print(allAs[m])
					print(allA[m])
					print("--------")
				}
			}
		}

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)

		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		dispatch_async(queue) {
			self.chinese.getOneForSameOrNot()
			self.chinese.getSixForSelectTheSame_1()
			self.six = self.chinese.forSelectTheSame
		}

		for button in bigButtons {
			UIView.animateWithDuration(1.0, animations: { () -> Void in
				button.alpha = 1.0
				}, completion: { (_) -> Void in
					button.userInteractionEnabled = true
			})
		}

    }

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)


	}

	func addThreeMainButtons() {

		let titles = ["SAME OR DIFFERENT", "SELECT THE SAME", "SPELL IT"]
		let buttonHeight: CGFloat = 60
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2)

		for i in 0..<3 {
			let button = UIButton(type: .System)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: buttonHeight)
			button.center = CGPoint(x: center.x, y: center.y + (buttonHeight + 20) * CGFloat(i))

			button.backgroundColor = UIColor.whiteColor()
			button.tintColor = UIColor.themeBlue()
			button.titleLabel?.font = UIFont.systemFontOfSize(19)
			button.setTitle(titles[i], forState: .Normal)
			button.exclusiveTouch = true

			button.tag = 10 + i
			button.addTarget(self, action: "bigButtonTapped:", forControlEvents: .TouchUpInside)

			button.alpha = 0.0
			button.userInteractionEnabled = false

			bigButtons.append(button)
			self.view.addSubview(button)
		}
	}

	func removeThreeMainButtons() {
		for i in 0..<3 {
			if let button = self.view.viewWithTag(10 + i) {
				button.removeFromSuperview()
			}
		}
	}

	func bigButtonTapped(sender: UIButton) {

		switch sender.tag {
		case 10:
			let sameOrNotVC = SameOrNotViewController()
			sameOrNotVC.firstData = chinese.forSameOrNot
			self.navigationController?.pushViewController(sameOrNotVC, animated: true)

		case 11:
			if self.six.count == 6 {
				let selectTheSameVC = SelectTheSameViewController()
				selectTheSameVC.firstData = self.six
				self.navigationController?.pushViewController(selectTheSameVC, animated: true)
			} else {
				print("not complete")
			}
		case 12:
			let spellVC = SpellViewController()
			self.navigationController?.pushViewController(spellVC, animated: true)

		default:
			break
		}
	}
    

}

