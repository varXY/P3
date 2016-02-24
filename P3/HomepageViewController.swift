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

	var chinese: Chinese!

	var bigButtons = [UIButton]()

	var scoreModel = ScoreModel()

	var sound: Bool!
	var vibration: Bool!

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.themeBlue()

//		addTwoDescribeLabels()
//		addThreeMainButtons()
//		addTwoLittleButtons()

//		let chinese_3 = Chinese_3()
//
//		let olds = [
//			chinese_3.pinyin_characters_A,
//			chinese_3.pinyin_characters_B,
//			chinese_3.pinyin_characters_C,
//			chinese_3.pinyin_characters_D,
//			chinese_3.pinyin_characters_E,
//			chinese_3.pinyin_characters_F,
//			chinese_3.pinyin_characters_G,
//			chinese_3.pinyin_characters_H,
//			chinese_3.pinyin_characters_J,
//			chinese_3.pinyin_characters_K,
//			chinese_3.pinyin_characters_L,
//			chinese_3.pinyin_characters_M,
//			chinese_3.pinyin_characters_N,
//			chinese_3.pinyin_characters_O,
//			chinese_3.pinyin_characters_P,
//			chinese_3.pinyin_characters_Q,
//			chinese_3.pinyin_characters_R,
//			chinese_3.pinyin_characters_S,
//			chinese_3.pinyin_characters_T,
//			chinese_3.pinyin_characters_W,
//			chinese_3.pinyin_characters_X,
//			chinese_3.pinyin_characters_Y,
//			chinese_3.pinyin_characters_Z,
//		]

		var letter = [[String]]()
		letter = temp1.sort({ $0[0] < $1[0] })

		print(letter)

    }

	var pinyins = ["nai", "ban", "cen", "hei", "pei", "me", "ne", "ni", "niang", "sui", "o", "piao", "ti", "a", "ai", "ba", "bai", "bang", "beng", "bei", "bi", "pian", "bian", "bo", "tian", "can", "cang", "zang", "ce", "chai", "chan", "zhang", "che", "deng", "chi", "chou", "chuan", "chao", "chuo", "cuo", "da", "dai", "tan", "de", "di", "dian", "diao", "tiao", "ding", "dong", "tong", "dou", "du", "dui", "tun", "dun", "duo", "e", "er", "fan", "feng", "fo", "fou", "fu", "hao", "gao", "ge", "gei", "gong", "guang", "ha", "heng", "hong", "hu", "hua", "huai", "huan", "hai", "kuai", "hui", "hun", "huo", "gu", "gai", "jie", "jin", "geng", "jing", "jiong", "jue", "jun", "ga", "ka", "kai", "gang", "kang", "ke", "keng", "kui", "kuo", "la", "lan", "lei", "leng", "liang", "ling", "lian", "lao", "le", "liao", "lou", "liu", "lu", "lv", "guan", "lun", "luo", "mai", "man", "mang", "mao", "meng", "mei", "mi", "mian", "ma", "mo", "mou", "mu", "nei", "na", "nuo", "niao", "long", "nong", "nu", "nv", "nve", "pa", "pang", "pan", "pao", "pi", "bing", "ping", "pai", "po", "pou", "bu", "bao", "pu", "qi", "qia", "gan", "jian", "kan", "jiang", "qiang", "jia", "qie", "qing", "qin", "ou", "qu", "juan", "quan", "gui", "qiao", "que", "ru", "ruo", "sai", "se", "shai", "chang", "sao", "chen", "shen", "xing", "cheng", "sheng", "dan", "shou", "zhu", "shu", "shuo", "shuai", "shui", "si", "sou", "xiu", "suo", "su", "shang", "tang", "tao", "ting", "tui", "ta", "tuo", "wan", "wang", "wei", "guo", "wo", "wu", "ji", "xi", "sha", "he", "xia", "qian", "xian", "hang", "xiang", "jiao", "xiao", "xin", "chu", "xue", "xun", "ya", "xie", "yi", "yan", "yin", "yong", "tu", "xu", "yu", "yuan", "yun", "yue", "yao", "cuan", "zan", "zao", "ze", "zen", "ceng", "za", "cha", "shan", "zhai", "nian", "zhan", "shao", "she", "zhe", "shi", "zhi", "chong", "zhong", "zhou", "zhao", "zhua", "ye", "zhuai", "zhuan", "zhuang", "chui", "zhui", "zhuo", "ci", "zai", "zi", "zeng", "zong", "ju", "cu", "zu", "zha", "zuo"]

	func getNewABC(old: [[String]]) {
		for couple in old {
			var newCouple = [String]()
			newCouple.append(couple[0])
			for i in 1..<couple.count {
				if let index = newCouple.indexOf(couple[i]) {
					newCouple.removeAtIndex(index)
				}

				newCouple.append(couple[i])
			}
			print(newCouple)
		}
	}

	

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)
		setSoundAndVibration()

		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		dispatch_async(queue) {
			if self.chinese.forSameOrNot.count == 0 { self.chinese.getOneForSameOrNot() }
			if self.chinese.forSpell.count == 0 { self.chinese.getOneForSpell() }

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
		let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight / 2 - (AutoSize.bigButtonHeight * 1.5 + AutoSize.gapHeight)))
		titleLabel.text = "Pinyin Comparison"
		titleLabel.textAlignment = .Center
		titleLabel.textColor = UIColor.blackColor()
		titleLabel.font = UIFont.homepageTitleFont(fontSizesForDescribleLabels()[0])
		view.addSubview(titleLabel)

		let footerLabel = UILabel(frame: CGRect(x: 0, y: ScreenHeight / 2 + AutoSize.bigButtonHeight * 1.5 + AutoSize.gapHeight, width: ScreenWidth, height: titleLabel.frame.height - 80))
		footerLabel.text = "Efficient ways to learn Pinyin and Chinese"
		footerLabel.textAlignment = .Center
		footerLabel.textColor = UIColor.deepGray()
		footerLabel.font = UIFont.italicSystemFontOfSize(fontSizesForDescribleLabels()[1])
		view.addSubview(footerLabel)
	}

	func fontSizesForDescribleLabels() -> [CGFloat] {
		switch ScreenWidth {
		case 320: return [32, 15, 22]
		case 375: return [37, 17, 22]
		case 414: return [40, 19, 22]
		default:return [38, 15, 22]
		}
	}

	struct AutoSize {
		static let bigButtonHeight: CGFloat = {
			switch ScreenHeight {
			case 480, 568: return 60 // 60 70 78
			case 667: return 60
			case 736: return 60
			default: return 60
			}
		}()

		static let gapHeight: CGFloat = {
			switch ScreenHeight {
			case 480, 568: return 30
			case 667: return 44
			case 736: return 50
			default: return 30
			}
		}()
	}

	func addThreeMainButtons() {

		let buttonHeight: CGFloat = AutoSize.bigButtonHeight
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2 - (AutoSize.bigButtonHeight + AutoSize.gapHeight))

		for i in 0..<3 {
			let button = UIButton(type: .System)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: buttonHeight)
			button.center = CGPoint(x: center.x, y: center.y + (buttonHeight + AutoSize.gapHeight) * CGFloat(i))

			button.backgroundColor = UIColor.clearColor()
			let size = fontSizesForDescribleLabels()[2]
			button.addTextLabel(Titles.homepageBigButtons[i], textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(size), animated: false)
			button.changeColorWhenTouchDown(UIColor.whiteColor())
			button.addBorder(borderColor: UIColor.whiteColor(), width: 2.0)

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

		let xPositons: [CGFloat] = [0, self.view.frame.width - 70]
		let images = [UIImage(named: ImageName.Record), UIImage(named: ImageName.Setting)]
		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: xPositons[i], y: self.view.frame.height - 70, width: 70, height: 70)
			button.tintColor = UIColor.whiteColor()
			button.setImage(images[i], forState: .Normal)
			button.exclusiveTouch = true
			button.tag = 9111 + i
			button.addTarget(self, action: "smallButtonTapped:", forControlEvents: .TouchUpInside)
			view.addSubview(button)
		}
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
	}

	func bigButtonTapped(sender: UIButton) {

		var viewController: TestViewController!

		switch sender.tag {
		case 10: viewController = SameOrNotViewController()
		case 11: viewController = SelectTheSameViewController()
		case 12: viewController = SpellViewController()
		default: break
		}

		viewController.sound = sound
		viewController.vibration = vibration
		viewController.chinese = chinese
		viewController.totalScore = scoreModel.totalScore
		viewController.sendBackScore = { (totalScore, score) -> Void in
			self.scoreModel.totalScore = totalScore
			self.scoreModel.scores.insert(score, atIndex: 0)
		}

		navigationController?.pushViewController(viewController, animated: true)
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
			if sorted.count != 0 {
				maxDailyNumber = UInt(sorted[0])
			} else {
				maxDailyNumber = 0
			}

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

