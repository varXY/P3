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

	var picker = UIPickerView()
	var quitButton = UIButton()

	let component_titles_0 = ["无", "b", "p", "m", "f", "d", "t", "n", "l", "z", "c", "s", "zh", "ch", "sh", "r", "j", "q", "x", "g", "k", "h", "y", "w"]
	let component_titles_1 = ["无", "a", "o", "e", "i", "u", "v"]
	let component_titles_2 = ["无", "i", "n", "o", "u", "r", "a", "e"]
	let component_titles_3 = ["无", "g", "n", "ng", "o", "u", "i"]

	var component_allTitles = [[String]]()

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		quitButton = UIButton(type: .InfoLight)
		quitButton.frame = CGRect(x: view.frame.width - 50, y: 20, width: 30, height: 30)
		quitButton.addTarget(self, action: "confirmToQuit", forControlEvents: .TouchUpInside)
		self.view.addSubview(quitButton)

		component_allTitles = [component_titles_0, component_titles_1, component_titles_2, component_titles_3]

		picker.frame = CGRect(x: 30, y: (self.view.frame.height - 60) / 2, width: self.view.frame.width - 60, height: (self.view.frame.height - 60) / 2)
		picker.showsSelectionIndicator = true
		picker.tintColor = UIColor.whiteColor()
		picker.dataSource = self
		picker.delegate = self
		self.view.addSubview(picker)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)

		chinese.getOneForSpell()
		print(chinese.forSpell)
	}

	func confirmToQuit() {
		self.navigationController?.popViewControllerAnimated(true)
	}

}


extension SpellViewController: UIPickerViewDataSource, UIPickerViewDelegate {

	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 4
	}

	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		let rows = [24, 7, 8, 7]
		return rows[component]
	}

	func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 30
	}

//	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//		return component_allTitles[component][row]
//	}

	func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
		let string = component_allTitles[component][row]
		let title = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
		return title
	}

	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

		var selectedPinyin = String()

		let indexs = [picker.selectedRowInComponent(0), picker.selectedRowInComponent(1), picker.selectedRowInComponent(2), picker.selectedRowInComponent(3)]

		for i in 0..<indexs.count {
			let string = yinFromIndex(i, index: indexs[i])
			selectedPinyin += string
		}

		print(selectedPinyin)
	}

	func yinFromIndex(component: Int, index: Int) -> String {
		if index == 0 {
			return ""
		} else {
			let titles = component_allTitles[component]
			let yin = titles[index]
			return yin
		}
	}


}










