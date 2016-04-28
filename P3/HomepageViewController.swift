//
//  ViewController.swift
//  P3
//
//  Created by Bobo on 1/22/16.
//  Copyright © 2016 myname. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {

	var chinese: Chinese!
	var scoreModel = ScoreModel()

	var bigButtons = [UIButton]()

	var sound: Bool!
	var vibration: Bool!

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)

		addTwoDescribeLabels()
		addThreeMainButtons()
		addTwoLittleButtons()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)


//		print(chinese.selectTheSame60Characters)
//		print(chinese.selectTheSame60Pinyins)

		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		dispatch_async(queue) {
			if self.chinese.forSameOrNot.count == 0 { self.chinese.getOneForSameOrNot() }
			if self.chinese.forSpell.count == 0 { self.chinese.getOneForSpell() }

			dispatch_async(dispatch_get_main_queue()) {
				self.bigButtons.forEach({
					$0.userInteractionEnabled = true
					$0.changeToColor(UIColor.clearColor())
					let i = self.bigButtons.indexOf($0)!
					$0.viewAddAnimation(.Appear, delay: 0.1 * Double(i), distance: 55 + 35 * CGFloat(i))
				})
			}
		}

    }

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		bigButtons.forEach({ $0.viewAddAnimation(.Disappear, delay: 0.0, distance: 0.0) })
	}

	struct AutoSize {
		static let gapHeight: CGFloat = {
			switch ScreenHeight {
			case 480, 568: return 30
			case 667: return 44
			case 736: return 50
			default: return 30
			}
		}()

		static let fontSize: [CGFloat] = {
			switch ScreenWidth {
			case 320: return [32, 15, 22]
			case 375: return [37, 17, 22]
			case 414: return [40, 19, 22]
			default:return [38, 15, 22]
			}
		}()
	}

	func addTwoDescribeLabels() {
		let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight / 2 - (60 * 1.5 + AutoSize.gapHeight)))
		titleLabel.text = NSLocalizedString("Pinyin Comparison", comment: "Homepage")
		titleLabel.textAlignment = .Center
		titleLabel.textColor = UIColor.colorWithValues(MyColors.P_gold)
		titleLabel.font = UIFont.homepageTitleFont(AutoSize.fontSize[0])
		view.addSubview(titleLabel)

		let footerLabel = UILabel(frame: CGRect(x: 0, y: ScreenHeight / 2 + 60 * 1.5 + AutoSize.gapHeight, width: ScreenWidth, height: titleLabel.frame.height - 70))
		footerLabel.text = NSLocalizedString("Efficient ways to learn Pinyin and Chinese", comment: "Homepage")
		footerLabel.textAlignment = .Center
		footerLabel.textColor = UIColor.colorWithValues(MyColors.P_gold)
		footerLabel.font = UIFont.systemFontOfSize(AutoSize.fontSize[1])
		view.addSubview(footerLabel)
	}

	func addThreeMainButtons() {
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2 - (60 + AutoSize.gapHeight))
		let indexes = [0, 1, 2]
		bigButtons = indexes.map({
			let button = UIButton(type: .System)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: 60)
			button.center = CGPoint(x: center.x, y: center.y + (60 + AutoSize.gapHeight) * CGFloat($0))

			button.backgroundColor = UIColor.clearColor()
			let size = AutoSize.fontSize[2]
			button.addTextLabel(Titles.homepageBigButtons[$0], textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(size), animated: false)
			button.changeColorWhenTouchDown(UIColor.whiteColor())
			button.addBorder(borderColor: UIColor.whiteColor(), width: 2.0)

			button.exclusiveTouch = true
			button.alpha = 0.0
			button.userInteractionEnabled = false
			button.tag = 10 + $0
			button.addTarget(self, action: #selector(HomepageViewController.bigButtonTapped(_:)), forControlEvents: .TouchUpInside)

			view.addSubview(button)
			return button
		})
	}

	func addTwoLittleButtons() {
		let xPositons: [CGFloat] = [0, self.view.frame.width - 70]
		let images = [UIImage(named: ImageName.Record), UIImage(named: ImageName.Setting)]
		let indexes = [0, 1]
		let _: [UIButton] = indexes.map({
			let button = UIButton(type: .System)
			button.frame = CGRect(x: xPositons[$0], y: self.view.frame.height - 70, width: 70, height: 70)
			button.tintColor = UIColor.whiteColor()
			button.setImage(images[$0], forState: .Normal)
			button.exclusiveTouch = true
			button.tag = 9111 + $0
			button.addTarget(self, action: #selector(smallButtonTapped(_:)), forControlEvents: .TouchUpInside)
			view.addSubview(button)
			return button
		})
	}

	func setSoundAndVibration() {
		let defaults = NSUserDefaults.standardUserDefaults()

		if let sound = defaults.valueForKey(Defaults.sound) as? Bool {
			self.sound = sound
		} else {
			self.sound = true
			defaults.setBool(true, forKey: Defaults.sound)
		}

		if let vibration = defaults.valueForKey(Defaults.vibration) as? Bool {
			self.vibration = vibration
		} else {
			self.vibration = true
			defaults.setBool(true, forKey: Defaults.vibration)
		}

		defaults.synchronize()
	}

	func spellStyleIsFreeStyle() -> Bool {
		let userdefaults = NSUserDefaults.standardUserDefaults()
		if let style = userdefaults.valueForKey(Defaults.SpellStyle) as? String {
			return style == "Free"
		} else {
			userdefaults.setObject("Q&A", forKey: Defaults.SpellStyle)
			userdefaults.synchronize()
			return false
		}
	}

	func bigButtonTapped(sender: UIButton) {
		goToPageBaseOnTag(sender.tag - 10)
	}

	func goToPageBaseOnTag(tag: Int) {
		setSoundAndVibration()
		var viewController: TestViewController!

		switch tag {
		case 0:
			viewController = SameOrNotViewController()
		case 1:
			viewController = SelectTheSameViewController()
		case 2:
			viewController = SpellViewController()
			viewController.freeStyle = spellStyleIsFreeStyle()
		default: break
		}

		viewController.sound = sound
		viewController.vibration = vibration
		viewController.chinese = chinese
		viewController.totalScore = scoreModel.totalScore
		viewController.sendBackScore = { [weak self] totalScore, score -> Void in
			self!.scoreModel.totalScore = totalScore
			self!.scoreModel.scores.insert(score, atIndex: 0)
			self!.chinese.selectTheSame60Characters = viewController.chinese.selectTheSame60Characters
			self!.chinese.selectTheSame60Pinyins = viewController.chinese.selectTheSame60Pinyins
		}

		navigationController?.pushViewController(viewController, animated: true)
	}

	func smallButtonTapped(sender: UIButton) {
		let recordButtonTapped = sender.tag == 9111

		if recordButtonTapped {
			let uniqDays = uniq(scoreModel.scores.map({ dateFormatter.stringFromDate($0.time) }))
			let dailyNumbers: [Int] = uniqDays.map({ day -> Int in
				let numbersInOneDay = scoreModel.scores.filter({ (score) -> Bool in
					dateFormatter.stringFromDate(score.time) == day
				})

				let dailyNumber = numbersInOneDay.reduce(0, combine: { $0 + $1.score })
				return dailyNumber
			})

			let dailyScores: [DailyScore] = uniqDays.map({
				return DailyScore(date: $0, score: dailyNumbers[uniqDays.indexOf($0)!])
			})

			let sorted = dailyNumbers.map({ return $0 < 0 ? -$0 : $0 }).sort({ $0 > $1 })
			let maxDailyNumber = sorted.count != 0 ? UInt(sorted[0]) : 0

			let recordVC = RecordViewController()
			recordVC.totalScore = scoreModel.totalScore
			recordVC.dailyScores = dailyScores
			recordVC.maxDailyNumber = maxDailyNumber
			presentViewController(NavigationController(rootViewController: recordVC), animated: true, completion: nil)

		} else {
			presentViewController(NavigationController(rootViewController: SettingViewController()), animated: true, completion: nil)
		}

	}

}

