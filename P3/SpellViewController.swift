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

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		componentType = 1
		component_allTitles = componentType == 0 ? [component_titles_0, component_titles_1, component_titles_2, component_titles_3] : [component_titles_0, component_titles_1, component_titles_2_0]

		titleLabel.frame.size = CGSize(width: 200, height: 60)
		titleLabel.frame.origin = CGPoint(x: 20, y: 5)
		titleLabel.textColor = UIColor.whiteColor()
		titleLabel.text = "1/10"
		self.view.addSubview(titleLabel)

		quitButton = UIButton(type: .InfoLight)
		quitButton.frame = CGRect(x: view.frame.width - 50, y: 20, width: 30, height: 30)
		quitButton.addTarget(self, action: "confirmToQuit", forControlEvents: .TouchUpInside)
		self.view.addSubview(quitButton)

		prepareScrollView(firstTime: true)

		picker.frame = CGRect(x: 30, y: (self.view.frame.height - 70) / 2, width: self.view.frame.width - 60, height: (self.view.frame.height - 60) / 2)
		picker.showsSelectionIndicator = true
		picker.tintColor = UIColor.whiteColor()
		picker.dataSource = self
		picker.delegate = self
		self.view.addSubview(picker)

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
		scrollView = UIScrollView(frame: CGRect(x: x, y: 60, width: self.view.frame.width, height: ScreenWidth - 120))
		scrollView.contentSize = CGSize(width: scrollView.frame.width * 10, height: scrollView.frame.height)
		scrollView.backgroundColor = UIColor.deepGray()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		self.view.addSubview(scrollView)
		self.view.bringSubviewToFront(titleLabel)
		self.view.bringSubviewToFront(quitButton)

		currentPage = 0
		addContent(currentPage)
	}

	func addContent(page: Int) {
		chinese.getOneForSpell()
		self.selectedIndex = 0
		self.showed = false

		let positionInPage = scrollView.frame.width * CGFloat(page)
		let point = CGPoint(x: positionInPage + 60, y: 0)
		let blockView = BlockView(type: .Spell, origin: point, text: chinese.forSpell)
		blockView.changeColor(selectedIndex, colorType: .White, backToBlue: false)
		blockViews.append(blockView)
		scrollView.addSubview(blockViews[blockViews.count - 1])
	}

	func removeContent() {
		blockViews[0].removeFromSuperview()
	}

	func addNextButton() {

		let button = UIButton(type: .System)
		button.frame = CGRect(x: 40, y: self.view.frame.height, width: self.view.frame.width - 80, height: 50)
		button.backgroundColor = UIColor.whiteColor()
		button.setTitle("Next", forState: .Normal)
		self.view.addSubview(button)

		UIView.animateWithDuration(0.5, animations: { () -> Void in
			button.frame.origin.y -= 70

			}) { (_) -> Void in
				button.addTarget(self, action: "next:", forControlEvents: .TouchUpInside)
		}

	}

	func next(sender: UIButton) {

		UIView.animateWithDuration(0.5, animations: { () -> Void in
			sender.frame.origin.y += 70
		})

		if self.currentPage <= 9 {
			delay(seconds: 0.5, completion: { () -> () in
				self.titleLabel.text = "\(self.currentPage + 1)/10"
				self.jumpToPage(self.currentPage)
			})
		} else {
			self.titleLabel.text = "complete"
			delay(seconds: 2.0, completion: { () -> () in
				self.scrollView.removeFromSuperview()
				self.picker.alpha = 0.0
				self.prepareScrollView(firstTime: false)
			})

			delay(seconds: 3.0, completion: { () -> () in
				self.addCompletedPage()
			})
		}

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
		print(selectedPinyin)
		print(pinyins[selectedIndex])

		if pinyins[selectedIndex] == selectedPinyin && !showed {
			showed = true
			blockView.changeColor(selectedIndex, colorType: .Green, backToBlue: true)

			delay(seconds: 0.2, completion: { () -> () in
				blockView.showPinyinAtIndex(self.selectedIndex)
			})

			if selectedIndex < blockView.colorfulViews.count - 1 {
				delay(seconds: 0.5, completion: { () -> () in
					self.showed = false
					self.selectedIndex++
					blockView.changeColor(self.selectedIndex, colorType: .White, backToBlue: false)
				})
			} else {

				delay(seconds: 0.4, completion: { () -> () in
					self.currentPage++
					self.addContent(self.currentPage)
				})
				delay(seconds: 0.5, completion: { () -> () in
					self.addNextButton()
				})
			}


		}
	}

	func addCompletedPage() {
		let contentView = UIView(frame: CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60))
		contentView.backgroundColor = UIColor.clearColor()
		contentView.tag = 110
		self.view.addSubview(contentView)

		let resultLabel = UILabel(frame: CGRect(x: 0, y: 60, width: contentView.frame.width, height: 60))
		resultLabel.textAlignment = .Center
		resultLabel.textColor = UIColor.whiteColor()
		resultLabel.font = UIFont.boldSystemFontOfSize(22)
//		resultLabel.text = "共答对了\(rightCount)题"
		contentView.addSubview(resultLabel)

		let titles = ["Again", "Quit"]

		for i in 0..<2 {
			let button = UIButton(type: .System)
			button.frame = CGRect(x: 20, y: (contentView.frame.height - 160) + 80 * CGFloat(i), width: contentView.frame.width - 40, height: 60)
			button.backgroundColor = UIColor.whiteColor()
			button.setTitle(titles[i], forState: .Normal)
			button.addTarget(self, action: "finalChoice:", forControlEvents: .TouchUpInside)
			button.exclusiveTouch = true
			button.tag = 120 + i
			contentView.addSubview(button)
		}


	}


	func finalChoice(sender: UIButton) {
		let again = sender.tag == 120

		if again {
			self.titleLabel.text = "1/10"
			self.rightCount = 0

			if let contentView = self.view.viewWithTag(110) {

				UIView.animateWithDuration(0.4, animations: { () -> Void in
					contentView.alpha = 0.0
					self.scrollView.frame.origin.x -= self.view.frame.width
					self.picker.alpha = 1.0
					}, completion: { (_) -> Void in
						contentView.removeFromSuperview()
				})

			}

		} else {
			confirmToQuit()
		}
	}

	func confirmToQuit() {
		self.navigationController?.popViewControllerAnimated(true)
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










