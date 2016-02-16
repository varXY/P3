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

	var blockView: BlockView!
	var bigButtons = [UIButton]()

	var six = [[String]]()
	var scoreModel = ScoreModel()

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.themeBlue()

		let titleLabel = UILabel(frame: CGRect(x: 0, y: 55, width: view.frame.width, height: 60))
		titleLabel.text = "Pinyin Comparison"
		titleLabel.textAlignment = .Center
		titleLabel.textColor = UIColor.blackColor()
		titleLabel.font = UIFont.boldSystemFontOfSize(25)
		view.addSubview(titleLabel)

		let footerLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height - 130, width: view.frame.width, height: 60))
		footerLabel.text = "Efficient ways to learn Pinyin and Chinese"
		footerLabel.textAlignment = .Center
		footerLabel.textColor = UIColor.deepGray()
		footerLabel.font = UIFont.italicSystemFontOfSize(15)
		view.addSubview(footerLabel)

//		addBlockView()
		addThreeMainButtons()
		addTwoLittleButtons()

//		let trash = Trash_1()
//		let confusables = [trash.confusableFirstInB, trash.confusableFirstInC, trash.confusableFirstInD, trash.confusableFirstInE, trash.confusableFirstInF, trash.confusableFirstInG]
//		let contents = [trash.B, trash.C, trash.D, trash.E, trash.F, trash.G]
//
//		for i in 0..<contents.count {
//			let content = contents[i]
//
//			var allA = [String]()
//			var allAs = [String]()
//
//			var allB = [String]()
//			var allBs = [String]()
//
//			for j in 0..<confusables[i].count {
//				let confusable = confusables[i][j]
//				let yins = confusable.componentsSeparatedByString("，")
//				var a = ""
//				var b = ""
//
//				for pinyin in content {
//					if let range = pinyin.rangeOfString(yins[0]) {
//						a = pinyin
//						a.replaceRange(range, with: "")
//						allA.append(a)
//						allAs.append(pinyin)
//						print(a)
//					}
//				}
//
//				for pinyin in content {
//					if let range = pinyin.rangeOfString(yins[1]) {
//						b = pinyin
//						b.replaceRange(range, with: "")
//						allB.append(b)
//						allBs.append(pinyin)
//						print(b)
//					}
//				}
//
//			}
//
//			for m in 0..<allA.count {
//				if let _ = allB.indexOf(allA[m]) {
//					print(confusables[i])
//					print(allAs[m])
//					print(allA[m])
//					print("--------")
//				}
//			}
//		}

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
				button.changeColorBack()
				}, completion: { (_) -> Void in
					button.userInteractionEnabled = true
			})
		}

    }

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
	}

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

	func addThreeMainButtons() {

		let buttonHeight: CGFloat = 60
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2 - 90)

		for i in 0..<3 {
			let button = UIButton(type: .System)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: buttonHeight)
			button.center = CGPoint(x: center.x, y: center.y + (buttonHeight + 30) * CGFloat(i))

			button.backgroundColor = UIColor.clearColor()
			button.tintColor = UIColor.whiteColor()
			button.titleLabel?.font = UIFont.systemFontOfSize(22)
			button.setTitle(Titles.homepageBigButtons[i], forState: .Normal)
			button.exclusiveTouch = true
			button.changeColorWhenTouchDown()
			button.addBorder()

			button.tag = 10 + i
			button.addTarget(self, action: "bigButtonTapped:", forControlEvents: .TouchUpInside)

			button.alpha = 0.0
			button.userInteractionEnabled = false

			bigButtons.append(button)
			self.view.addSubview(button)
		}
	}

	func addTwoLittleButtons() {

		let xPositons: [CGFloat] = [10, self.view.frame.width - 90]

		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: xPositons[i], y: self.view.frame.height - 45, width: 80, height: 30)
			button.tintColor = UIColor.deepGray()
			button.setTitle(Titles.homepageSmallButtons[i], forState: .Normal)
			button.titleLabel?.font = UIFont.buttonTitleFont(15)
			button.exclusiveTouch = true
			button.addTarget(self, action: "smallButtonTapped:", forControlEvents: .TouchUpInside)
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

	func blockViewChangeContent() {
		chinese.getOneForSpell()
		blockView.homepageChanging(chinese.forSpell)
	}

	func bigButtonTapped(sender: UIButton) {

		switch sender.tag {
		case 10:
			let sameOrNotVC = SameOrNotViewController()
			sameOrNotVC.firstData = chinese.forSameOrNot
			sameOrNotVC.scoreModel = scoreModel

			sameOrNotVC.sendBackScore = { (totalScore, score) -> Void in
				self.scoreModel.totalScore = totalScore
				self.scoreModel.scores.insert(score, atIndex: 0)
				print(self.scoreModel.totalScore)
				print(self.scoreModel.scores.count)
				print(self.scoreModel.scores[0].score)
			}

			self.navigationController?.pushViewController(sameOrNotVC, animated: true)

		case 11:
			if self.six.count == 6 {
				let selectTheSameVC = SelectTheSameViewController()
				selectTheSameVC.firstData = self.six
				selectTheSameVC.totalScore = scoreModel.totalScore

				selectTheSameVC.sendBackScore = { (totalScore, score) -> Void in
					self.scoreModel.totalScore = totalScore
					self.scoreModel.scores.insert(score, atIndex: 0)
					print(self.scoreModel.totalScore)
					print(self.scoreModel.scores.count)
					print(self.scoreModel.scores[0].score)
				}

				self.navigationController?.pushViewController(selectTheSameVC, animated: true)
			} else {
				print("not complete")
			}
			
		case 12:
			let spellVC = SpellViewController()
			spellVC.totalScore = scoreModel.totalScore
			spellVC.sendBackScore = { (totalScore, score) -> Void in
				self.scoreModel.totalScore = totalScore
				self.scoreModel.scores.insert(score, atIndex: 0)
				print(self.scoreModel.totalScore)
				print(self.scoreModel.scores.count)
				print(self.scoreModel.scores[0].score)
			}
			
			self.navigationController?.pushViewController(spellVC, animated: true)

		default:
			break
		}
	}

	func smallButtonTapped(sender: UIButton) {

		if sender.titleLabel?.text == Titles.homepageSmallButtons[0] {
			var days = [String]()
			var numbers = [Int]()
			var maxDailyNumber: UInt = 0
			var dailyScores = [DailyScore]()

			for score in scoreModel.scores {
				let day = dateFormatter.stringFromDate(score.time)
				if let index = days.indexOf(day) {
					days.removeAtIndex(index)
				}
				days.append(day)
			}

			for day in days {
				let scoresInSameDay = scoreModel.scores.filter({ dateFormatter.stringFromDate($0.time) == day })
				var dailyNumber = 0
				for score in scoresInSameDay { dailyNumber += score.score }
				let result = DailyScore(date: day, score: dailyNumber)
				dailyScores.append(result)
				numbers.append(abs(dailyNumber))
			}

			let sorted = numbers.sort({ $0 > $1 })
			maxDailyNumber = UInt(sorted[0])

			let recordVC = RecordViewController()
			recordVC.totalScore = scoreModel.totalScore
			recordVC.dailyScores = dailyScores
			recordVC.maxDailyNumber = maxDailyNumber
			let navi = NavigationController(rootViewController: recordVC)
			presentViewController(navi, animated: true, completion: nil)
		}

		if sender.titleLabel?.text == Titles.homepageSmallButtons[1] {
			let settingVC = SettingViewController()
			let navi = NavigationController(rootViewController: settingVC)
			presentViewController(navi, animated: true, completion: nil)
		}

	}
    

}

