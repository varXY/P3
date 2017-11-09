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

	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)

		addTwoDescribeLabels()
		addThreeMainButtons()
		addTwoLittleButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)


//		print(chinese.selectTheSame60Characters)
//		print(chinese.selectTheSame60Pinyins)

		let queue = DispatchQueue.global(qos: .background)
		queue.async {
			if self.chinese.forSameOrNot.count == 0 { self.chinese.getOneForSameOrNot() }
			if self.chinese.forSpell.count == 0 { self.chinese.getOneForSpell() }

			DispatchQueue.main.async {
				self.bigButtons.forEach({
					$0.isUserInteractionEnabled = true
					$0.changeToColor(UIColor.clear)
					let i = self.bigButtons.index(of: $0)!
					$0.viewAddAnimation(.appear, delay: 0.1 * Double(i), distance: 55 + 35 * CGFloat(i))
				})
			}
		}

    }

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		bigButtons.forEach({ $0.viewAddAnimation(.disappear, delay: 0.0, distance: 0.0) })
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
		titleLabel.textAlignment = .center
		titleLabel.textColor = UIColor.colorWithValues(MyColors.P_gold)
		titleLabel.font = UIFont.homepageTitleFont(AutoSize.fontSize[0])
		view.addSubview(titleLabel)

		let footerLabel = UILabel(frame: CGRect(x: 0, y: ScreenHeight / 2 + 60 * 1.5 + AutoSize.gapHeight, width: ScreenWidth, height: titleLabel.frame.height - 70))
		footerLabel.text = NSLocalizedString("Efficient ways to learn Pinyin and Chinese", comment: "Homepage")
		footerLabel.textAlignment = .center
		footerLabel.textColor = UIColor.colorWithValues(MyColors.P_gold)
		footerLabel.font = UIFont.systemFont(ofSize: AutoSize.fontSize[1])
		view.addSubview(footerLabel)
	}

	func addThreeMainButtons() {
		let center = CGPoint(x: ScreenWidth / 2, y: ScreenHeight / 2 - (60 + AutoSize.gapHeight))
		let indexes = [0, 1, 2]
		bigButtons = indexes.map({
			let button = UIButton(type: .system)
			button.frame.size = CGSize(width: ScreenWidth - 40, height: 60)
			button.center = CGPoint(x: center.x, y: center.y + (60 + AutoSize.gapHeight) * CGFloat($0))

			button.backgroundColor = UIColor.clear
			let size = AutoSize.fontSize[2]
			button.addTextLabel(Titles.homepageBigButtons[$0], textColor: UIColor.white, font: UIFont.systemFont(ofSize: size), animated: false)
			button.changeColorWhenTouchDown(UIColor.white)
			button.addBorder(borderColor: UIColor.white, width: 2.0)

			button.isExclusiveTouch = true
			button.alpha = 0.0
			button.isUserInteractionEnabled = false
			button.tag = 10 + $0
			button.addTarget(self, action: #selector(HomepageViewController.bigButtonTapped(_:)), for: .touchUpInside)

			view.addSubview(button)
			return button
		})
	}

	func addTwoLittleButtons() {
		let xPositons: [CGFloat] = [0, self.view.frame.width - 70]
		let images = [#imageLiteral(resourceName: "Record"), #imageLiteral(resourceName: "Setting")]
		let indexes = [0, 1]
		let _: [UIButton] = indexes.map({
			let button = UIButton(type: .system)
			button.frame = CGRect(x: xPositons[$0], y: self.view.frame.height - 70, width: 70, height: 70)
			button.tintColor = UIColor.white
			button.setImage(images[$0], for: UIControlState())
			button.isExclusiveTouch = true
			button.tag = 9111 + $0
			button.addTarget(self, action: #selector(smallButtonTapped(_:)), for: .touchUpInside)
			view.addSubview(button)
			return button
		})
	}

	func setSoundAndVibration() {
		let defaults = UserDefaults.standard

		if let sound = defaults.value(forKey: Defaults.sound) as? Bool {
			self.sound = sound
		} else {
			self.sound = true
			defaults.set(true, forKey: Defaults.sound)
		}

		if let vibration = defaults.value(forKey: Defaults.vibration) as? Bool {
			self.vibration = vibration
		} else {
			self.vibration = true
			defaults.set(true, forKey: Defaults.vibration)
		}

		defaults.synchronize()
	}

	func spellStyleIsFreeStyle() -> Bool {
		let userdefaults = UserDefaults.standard
		if let style = userdefaults.value(forKey: Defaults.SpellStyle) as? String {
			return style == "Free"
		} else {
			userdefaults.set("Q&A", forKey: Defaults.SpellStyle)
			userdefaults.synchronize()
			return false
		}
	}

	@objc func bigButtonTapped(_ sender: UIButton) {
		goToPageBaseOnTag(sender.tag - 10)
	}

	func goToPageBaseOnTag(_ tag: Int) {
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
        viewController.delegate = self


		navigationController?.pushViewController(viewController, animated: true)
	}

	@objc func smallButtonTapped(_ sender: UIButton) {
		let recordButtonTapped = sender.tag == 9111

		if recordButtonTapped {
			let uniqDays = uniq(scoreModel.scores.map({ dateFormatter.string(from: $0.time) }))
			let dailyNumbers: [Int] = uniqDays.map({ day -> Int in
				let numbersInOneDay = scoreModel.scores.filter({ (score) -> Bool in
					dateFormatter.string(from: score.time) == day
				})

				let dailyNumber = numbersInOneDay.reduce(0, { $0 + $1.score })
				return dailyNumber
			})

			let dailyScores: [DailyScore] = uniqDays.map({
				return DailyScore(date: $0, score: dailyNumbers[uniqDays.index(of: $0)!])
			})

			let sorted = dailyNumbers.map({ return $0 < 0 ? -$0 : $0 }).sorted(by: { $0 > $1 })
			let maxDailyNumber = sorted.count != 0 ? UInt(sorted[0]) : 0

			let recordVC = RecordViewController()
			recordVC.totalScore = scoreModel.totalScore
			recordVC.dailyScores = dailyScores
			recordVC.maxDailyNumber = maxDailyNumber
			present(NavigationController(rootViewController: recordVC), animated: true, completion: nil)

		} else {
			present(NavigationController(rootViewController: SettingViewController()), animated: true, completion: nil)
		}

	}

}



extension HomepageViewController: TestViewControllerDelegate {
    
    
    func sendBackScore(totalScore: Int, newScore: Score, chinese: Chinese) {
        self.scoreModel.totalScore = totalScore
        self.scoreModel.scores.insert(newScore, at: 0)
        self.chinese.selectTheSame60Characters = chinese.selectTheSame60Characters
        self.chinese.selectTheSame60Pinyins = chinese.selectTheSame60Pinyins
    }
    
    
}

