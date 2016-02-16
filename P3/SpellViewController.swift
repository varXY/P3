//
//  SpellViewController.swift
//  P3
//
//  Created by 文川术 on 2/11/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit

class SpellViewController: UIViewController {

	let chinese = Chinese()

	var scrollView = UIScrollView()
	var blockViews = [BlockView]()
	var picker = UIPickerView()
	var titleLabel = UILabel()
	var quitButton = UIButton()

	var nextButton: NextButton!
	var headerView: HeaderView!

	var componentType = 0
	let component_titles_0 = [" ", "b", "c", "ch", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "sh", "t", "w", "x", "y", "z", "zh", " "]
	let component_titles_1 = [" ", "a", "e", "i", "o", "u", "v", " "]
	let component_titles_2 = [" ", "a", "e", "i", "n", "o", "r", "u", " "]
	let component_titles_3 = [" ", "g", "i", "n", "ng", "o", "u", " "]

	let component_titles_2_0 = [" ", "a", "ai", "an", "ang", "ao", "e", "ei", "en", "eng", "i", "n", "ng", "o", "ong", "ou", "r", "u", " "]

	var component_allTitles = [[String]]()

	var rightCount = 0
	var currentPage = 0
	var selectedPinyin = String()
	var selectedIndex = 0
	var showed = false

	var totalScore = Int()
	let rightScore = 2
	let wrongScore = -2

	var sendBackScore: ((totalScore: Int, newScore: Score) -> Void)!

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		let userDefaults = NSUserDefaults.standardUserDefaults()
		let amount = userDefaults.integerForKey(Defaults.C_amount)
		componentType = amount == 3 ? 1 : 0
		component_allTitles = componentType == 0 ? [component_titles_0, component_titles_1, component_titles_2, component_titles_3] : [component_titles_0, component_titles_1, component_titles_2_0]

		headerView = HeaderView(page: 1, score: totalScore)
		headerView.delegate = self
		view.addSubview(headerView)

		nextButton = NextButton(title: Titles.next)
		nextButton.delegate = self
		view.addSubview(nextButton)

		prepareScrollView(firstTime: true)

		picker.frame = CGRect(x: 30, y: ScreenHeight / 2, width: ScreenWidth - 60, height: ScreenHeight / 2 - 60)
		picker.showsSelectionIndicator = true
		picker.tintColor = UIColor.whiteColor()
		picker.dataSource = self
		picker.delegate = self
		view.addSubview(picker)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)

//		let indexs = [20, 5, 1, 3]
//
//		for i in 0..<indexs.count {
//			picker.selectRow(indexs[i], inComponent: i, animated: true)
//		}

	}

	func prepareScrollView(firstTime firstTime: Bool) {
		let x = firstTime ? 0 : self.view.frame.width
		scrollView = UIScrollView(frame: CGRect(x: x, y: 0, width: self.view.frame.width, height: ScreenHeight / 2))
		scrollView.contentSize = CGSize(width: scrollView.frame.width * 10, height: scrollView.frame.height)
		scrollView.backgroundColor = UIColor.deepGray()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		view.addSubview(scrollView)
		view.bringSubviewToFront(headerView)
		
		currentPage = 0
		addContent(currentPage)
	}

	func addContent(page: Int) {
		chinese.getOneForSpell()
		selectedIndex = 0
		showed = false

		let positionInPage = scrollView.frame.width * CGFloat(page)
		let point = CGPoint(x: positionInPage + (ScreenWidth - BlockWidth.spell) / 2, y: 60)
		let blockView = BlockView(type: .Spell, origin: point, text: chinese.forSpell)
		blockView.changeColor(selectedIndex, colorType: .White, backToBlue: false)
		blockViews.append(blockView)
		scrollView.addSubview(blockViews[blockViews.count - 1])
	}

	func removeContent() {
		blockViews[0].removeFromSuperview()
	}


	func jumpToPage(page: Int) {
		let duration = Double(scrollView.frame.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: {(_) -> Void in
				self.removeContent()
		})

	}

	func changeStateBaseOnSelectedPinyin(selectedPinyin: String) {
		let blockView = blockViews[blockViews.count - 1]
		let pinyins = blockView.text[0].componentsSeparatedByString(" ")

		if pinyins[selectedIndex] == selectedPinyin && !showed {
			showed = true
			blockView.changeColor(selectedIndex, colorType: .Green, backToBlue: true)

			delay(seconds: 0.2, completion: { () -> () in
				blockView.showPinyinAtIndex(self.selectedIndex)
			})

			if selectedIndex < blockView.colorfulViews.count - 1 {
				delay(seconds: 0.6, completion: { () -> () in
					self.showed = false
					self.selectedIndex++
					blockView.changeColor(self.selectedIndex, colorType: .White, backToBlue: false)
				})
			} else {
				headerView.showAndAddScore(rightScore)

				delay(seconds: 0.4, completion: { () -> () in
					self.currentPage++
					self.addContent(self.currentPage)
				})

				let title = currentPage == 9 ? Titles.done : Titles.next
				delay(seconds: 0.5, completion: { () -> () in
					self.nextButton.show(title)
				})
			}


		}
	}

	func confirmToQuit() {
		self.navigationController?.popViewControllerAnimated(true)
	}

}

extension SpellViewController: HeaderViewDelegate {

	func backButtonTapped() {
		if currentPage != 0 && currentPage != 10 {
			let alert = UIAlertController(title: "提示", message: "答题还没完成，确定退出吗？", preferredStyle: .Alert)
			let action = UIAlertAction(title: "确定", style: .Default, handler: ({ _ in self.confirmToQuit() }))
			alert.addAction(action)
			let action1 = UIAlertAction(title: "取消", style: .Default, handler: nil)
			alert.addAction(action1)
			presentViewController(alert, animated: true, completion: nil)
		} else {
			navigationController?.popToRootViewControllerAnimated(true)
		}

	}
}


extension SpellViewController: NextButtonDelegate {

	func nextButtonTapped(title: String) {

		if self.currentPage <= 9 {
			delay(seconds: 0.5, completion: { () -> () in
				self.headerView.changePage(self.currentPage + 1)
				self.jumpToPage(self.currentPage)
			})
		} else {
			self.headerView.pageToTitle("Completed")

			let score = self.headerView.currentScore >= 0 ? "+" + "\(headerView.currentScore)" : "\(headerView.currentScore)"
			let finalView = FinalView(title: "Score: " + score)
			finalView.delegate = self
			self.view.addSubview(finalView)

			UIView.animateWithDuration(0.5, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				}, completion: { (_) -> Void in
					self.scrollView.removeFromSuperview()
					finalView.show()
					self.prepareScrollView(firstTime: false)

					let score = Score(score: self.headerView.currentScore, time: NSDate())
					self.sendBackScore(totalScore: self.headerView.totalScore, newScore: score)
			})

		}

	}
}


extension SpellViewController: FinalViewDelegate {

	func finalViewButtonTapped(buttonType: FinalViewButtonType) {

		if buttonType == .Again {
			headerView.clearCurrentScore()
			headerView.changePage(1)

			UIView.animateWithDuration(0.5, animations: {
				self.scrollView.frame.origin.x -= self.view.frame.width
			})
		} else {
			confirmToQuit()
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
		return 35
	}

	func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
		let string = component_allTitles[component][row]
		let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(18)]
		let title = NSAttributedString(string: string, attributes: attributes)
		return title
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










