//
//  TestViewController.swift
//  P3
//
//  Created by 文川术 on 2/19/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit


class TestViewController: UIViewController {

	var chinese: Chinese!
	var totalScore: Int!
	var sendBackScore: ((totalScore: Int, newScore: Score) -> Void)!

	var blockViews = [BlockView]()
	var scrollView = UIScrollView()
	var headerView: HeaderView!
	var nextButton: NextButton!
	var finalView: FinalView!
	
	var sound: Bool!
	var vibration: Bool!

	var currentPage = 0
	var rightScore: Int!
	var wrongScore: Int!
	var rightCount = 0
	
	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.deepGray()

		finalView = FinalView()
		finalView.delegate = self
		view.addSubview(finalView)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}

	func setUpScrollView() {
		scrollView.contentSize = CGSize(width: scrollView.frame.width * 10, height: scrollView.frame.height)
		scrollView.backgroundColor = UIColor.deepGray()
		scrollView.pagingEnabled = true
		scrollView.scrollEnabled = false
		view.addSubview(scrollView)
		view.bringSubviewToFront(headerView)
		view.bringSubviewToFront(nextButton)
	}

	func jumpToPage(page: Int) {
		let duration = Double(scrollView.frame.width / 640)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0)
			}, completion: {(_) -> Void in
				self.removeContent()
		})

	}

	func removeContent() {

	}

	func confirmToQuit() {
		self.navigationController?.popViewControllerAnimated(true)
	}

}

extension TestViewController: HeaderViewDelegate {

	func backButtonTapped() {
		if currentPage != 0 && currentPage != 10 {
			alertOfStayOrQuit(self, title: "Sure to Quit?", message: "If you quit, current scores will lose.", quit: { self.confirmToQuit() })
		} else {
			navigationController?.popToRootViewControllerAnimated(true)
		}
	}
}

extension TestViewController: FinalViewDelegate {

	func finalViewButtonTapped(buttonType: FinalViewButtonType) {

		if buttonType == .Again {
			headerView.startAllOver()

			UIView.animateWithDuration(0.5, animations: {
				self.scrollView.frame.origin.x -= self.view.frame.width
			})
		} else {
			confirmToQuit()
		}
	}
}