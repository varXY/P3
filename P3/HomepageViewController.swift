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

	var chinese = Chinese()

	var bigButtons = [UIButton]()

	var scoreModel = ScoreModel()

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.themeBlue()

		addTwoDescribeLabels()
		addThreeMainButtons()
		addTwoLittleButtons()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)

		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		dispatch_async(queue) {
			self.chinese.getOneForSameOrNot()
			self.chinese.getOneForSpell()

			dispatch_async(dispatch_get_main_queue()) {
				for i in 0..<self.bigButtons.count {
					self.bigButtons[i].userInteractionEnabled = true
					self.bigButtons[i].viewAddAnimation(.Appear, delay: 0.1 * Double(i), distance: 40 + 30 * CGFloat(i))
				}
			}
		}



    }

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

		for i in 0..<self.bigButtons.count {
			self.bigButtons[i].viewAddAnimation(.Disappear, delay: 0.0, distance: 0.0)
		}
	}


	func addTwoDescribeLabels() {
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
	}


	func addThreeMainButtons() {

		let buttonHeight: CGFloat = 60
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2 - 90)

		for i in 0..<3 {
			let button = UIButton(type: .System)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: buttonHeight)
			button.center = CGPoint(x: center.x, y: center.y + (buttonHeight + 30) * CGFloat(i))

			button.backgroundColor = UIColor.clearColor()
			button.addTextLabel(Titles.homepageBigButtons[i], textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(22), animated: false)
			button.changeColorWhenTouchDown()
			button.addBorder(borderColor: UIColor.whiteColor())

			button.exclusiveTouch = true
			button.tag = 10 + i
			button.addTarget(self, action: "bigButtonTapped:", forControlEvents: .TouchUpInside)

			button.alpha = 0.0
			button.userInteractionEnabled = false

			bigButtons.append(button)
			view.addSubview(button)
		}
	}

	func addTwoLittleButtons() {

		let xPositons: [CGFloat] = [20, self.view.frame.width - 50]
		let images = [UIImage(named: ImageName.Record), UIImage(named: ImageName.Setting)]
		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: xPositons[i], y: self.view.frame.height - 50, width: 30, height: 30)
			button.tintColor = UIColor.whiteColor()
			button.setImage(images[i], forState: .Normal)
			button.exclusiveTouch = true
			button.tag = 9111 + i
			button.addTarget(self, action: "smallButtonTapped:", forControlEvents: .TouchUpInside)
			view.addSubview(button)
		}
	}

	func bigButtonTapped(sender: UIButton) {

		switch sender.tag {
		case 10:
			let sameOrNotVC = SameOrNotViewController()
			sameOrNotVC.firstData = chinese.forSameOrNot
			sameOrNotVC.totalScore = scoreModel.totalScore

			sameOrNotVC.sendBackScore = { (totalScore, score) -> Void in
				self.scoreModel.totalScore = totalScore
				self.scoreModel.scores.insert(score, atIndex: 0)
			}

			self.navigationController?.pushViewController(sameOrNotVC, animated: true)

		case 11:
			let selectTheSameVC = SelectTheSameViewController()
			selectTheSameVC.firstData = chinese.forSelectTheSame
			selectTheSameVC.totalScore = scoreModel.totalScore

			selectTheSameVC.sendBackScore = { (totalScore, score) -> Void in
				self.scoreModel.totalScore = totalScore
				self.scoreModel.scores.insert(score, atIndex: 0)
			}

			selectTheSameVC.sendBackGroup = { (group) -> Void in
				self.chinese.forSelectTheSame = group
			}

			self.navigationController?.pushViewController(selectTheSameVC, animated: true)
			
		case 12:
			let spellVC = SpellViewController()
			spellVC.firstData = chinese.forSpell
			spellVC.totalScore = scoreModel.totalScore

			spellVC.sendBackScore = { (totalScore, score) -> Void in
				self.scoreModel.totalScore = totalScore
				self.scoreModel.scores.insert(score, atIndex: 0)
			}
			
			self.navigationController?.pushViewController(spellVC, animated: true)

		default:
			break
		}
	}

	func smallButtonTapped(sender: UIButton) {

		let isRecord = sender.tag == 9111

		if isRecord {
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

		} else {
			let settingVC = SettingViewController()
			let navi = NavigationController(rootViewController: settingVC)
			presentViewController(navi, animated: true, completion: nil)
		}


	}
    

}

