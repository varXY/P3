//
//  SpellViewController.swift
//  P3
//
//  Created by 文川术 on 2/11/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SpellViewController: TestViewController {

	var picker = UIPickerView()

	var componentType = 0
	var pickerinitialRows = [Int]()
	let component_titles_0 = [" ", "b", "c", "ch", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "sh", "t", "w", "x", "y", "z", "zh", " "]
	let component_titles_1 = [" ", "a", "e", "i", "o", "u", "v", " "]
	let component_titles_2_0 = [" ", "a", "ai", "an", "ang", "ao", "e", "ei", "en", "eng", "i", "n", "ng", "o", "ong", "ou", "r", "u", " "]
	let component_titles_2 = [" ", "a", "e", "i", "n", "o", "r", "u", " "]
	let component_titles_3 = [" ", "g", "i", "n", "ng", "o", "u", " "]

	var component_allTitles = [[String]]()

	var selectedPinyin = String()
	var selectedIndex = 0
	var showed = false
	
	var staySeconds = 0

	override func viewDidLoad() {
		super.viewDidLoad()

		rightScore = 2
		wrongScore = -2

		var amount = 3
		let userDefaults = NSUserDefaults.standardUserDefaults()
		if let defaultsAmount = userDefaults.valueForKey(Defaults.C_amount) as? Int {
			amount = defaultsAmount
		} else {
			userDefaults.setInteger(amount, forKey: Defaults.C_amount)
		}
		pickerinitialRows = amount == 3 ? [13, 3, 11] : [13, 3, 8, 3]
		componentType = amount == 3 ? 1 : 0

		component_allTitles = componentType == 0 ? [component_titles_0, component_titles_1, component_titles_2, component_titles_3] : [component_titles_0, component_titles_1, component_titles_2_0]

		headerView = HeaderView(number: 1, totalScore: totalScore)
		headerView.delegate = self
		view.addSubview(headerView)

		nextButton = NextButton()
		nextButton.delegate = self
		view.addSubview(nextButton)

		prepareScrollView(firstTime: true)

		picker.frame = CGRect(x: 30, y: ScreenHeight / 2 - 10, width: ScreenWidth - 60, height: ScreenHeight / 2 - 60)
		picker.showsSelectionIndicator = true
		picker.tintColor = UIColor.whiteColor()
		picker.dataSource = self
		picker.delegate = self
		picker.alpha = 0.0
		view.addSubview(picker)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

		for i in 0..<picker.numberOfComponents {
			picker.selectRow(pickerinitialRows[i], inComponent: i, animated: false)
		}

		picker.viewAddAnimation(.BecomeVisble, delay: 0.0, distance: 0.0)
	}

	func prepareScrollView(firstTime firstTime: Bool) {
		let x = firstTime ? 0 : view.frame.width
		scrollView = UIScrollView(frame: CGRect(x: x, y: 0, width: ScreenWidth, height: ScreenHeight / 2))
		setUpScrollView()
		
		currentPage = 0
		addContent(currentPage, firstTime: firstTime)
	}

	func addContent(page: Int, firstTime: Bool) {

		if !firstTime { chinese.getOneForSpell() }

		selectedIndex = 0
		showed = false

		let positionInPage = scrollView.frame.width * CGFloat(page)
		let point = CGPoint(x: positionInPage + (ScreenWidth - BlockWidth.spell) / 2, y: 60)
		let blockView = BlockView(type: .Spell, origin: point, text: chinese.forSpell)
		blockView.changeColor(selectedIndex, colorType: .White, backToBlue: false)
		blockView.delegate = self
		blockViews.append(blockView)
		scrollView.addSubview(blockViews[blockViews.count - 1])
	}

	override func removeContent() {
		blockViews[0].removeFromSuperview()
	}

	func changeStateBaseOnSelectedPinyin(selectedPinyin: String) {
		let blockView = blockViews[blockViews.count - 1]
		let pinyins = blockView.text[0].componentsSeparatedByString(" ")

		if pinyins[selectedIndex] == selectedPinyin && !showed {
			showed = true
			if sound { rightSound.play() }
			blockView.changeColor(selectedIndex, colorType: .Green, backToBlue: true)

			delay(seconds: 0.6, completion: { () -> () in
				blockView.showPinyinAtIndex(self.selectedIndex)
			})

			if selectedIndex < blockView.colorfulViews.count - 1 {
				delay(seconds: 0.8, completion: { () -> () in
					self.showed = false
					self.selectedIndex++
					blockView.changeColor(self.selectedIndex, colorType: .White, backToBlue: false)
				})
			} else {
				headerView.showAndAddScore(rightScore)

				delay(seconds: 0.8, completion: { () -> () in
					let title: NextButtonTitle = self.currentPage == 9 ? .Done : .Next
					self.nextButton.show(title, dismissAfterTapped: true)
				})

				delay(seconds: 1.0, completion: { () -> () in
					self.currentPage++
					self.addContent(self.currentPage, firstTime: false)
				})

			}


		}
	}

}

extension SpellViewController: BlockViewDelegate {

	func blockViewSelected(selected: Bool, blockText: [String]) {
	}

	func answerShowedByQuestionMark() {
		if sound { wrongSound.play() }
		if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }

		delay(seconds: 0.8, completion: { () -> () in
			self.headerView.showAndAddScore(self.wrongScore)
			let title: NextButtonTitle = self.currentPage == 9 ? .Done : .Next
			self.nextButton.show(title, dismissAfterTapped: true)
		})

		delay(seconds: 0.85, completion: { () -> () in
			self.currentPage++
			self.addContent(self.currentPage, firstTime: false)
		})
	}
}


extension SpellViewController: NextButtonDelegate {

	func nextButtonTapped(title: NextButtonTitle) {

		if self.currentPage < 10 {
			delay(seconds: Time.toNextPageWaitingTime, completion: {
				self.headerView.changeNumber(toNumber: self.currentPage + 1)
				self.jumpToPage(self.currentPage)
			})
		} else {
			UIView.animateWithDuration(0.3, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				}, completion: { (_) -> Void in
					self.headerView.showAllNumbers()
					self.scrollView.removeFromSuperview()
					self.view.bringSubviewToFront(self.finalView)
					self.finalView.show(self.headerView.currentScore, delay: 0.5)
					self.prepareScrollView(firstTime: false)

					let score = Score(score: self.headerView.currentScore, time: NSDate())
					self.sendBackScore(totalScore: self.headerView.totalScore, newScore: score)
			})

		}

	}
}


extension SpellViewController: UIPickerViewDataSource, UIPickerViewDelegate {

	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return componentType == 0 ? 4 : 3
	}

	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		let rows = componentType == 0 ? [25, 8, 9, 8] : [25, 8, 19]
		return rows[component]
	}

	func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 40
	}

	func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: picker.frame.width / CGFloat(picker.numberOfComponents), height: 40))
		view.backgroundColor = UIColor.themeGold()
		let label = UILabel(frame: view.bounds)
		label.text = component_allTitles[component][row]
		label.textAlignment = .Center
		label.textColor = UIColor.deepGray()
		label.font = UIFont.pickerFont(25)
		view.addSubview(label)
		return view
	}

	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

		selectedPinyin = ""
		var indexs = [Int]()
		for i in 0..<picker.numberOfComponents {
			indexs.append(picker.selectedRowInComponent(i))
		}

		for i in 0..<indexs.count {
			let string = yinFromIndex(i, index: indexs[i])
			selectedPinyin += string
		}

		changeStateBaseOnSelectedPinyin(selectedPinyin)
	}

	func yinFromIndex(component: Int, index: Int) -> String {
		if index == 0 || index == component_allTitles[component].count - 1 {
			return ""
		} else {
			let titles = component_allTitles[component]
			let yin = titles[index]
			return yin
		}
	}


}










