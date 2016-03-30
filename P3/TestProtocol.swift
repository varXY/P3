//
//  TestProtocol.swift
//  Pinyin Comparison
//
//  Created by 文川术 on 3/29/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

protocol TestProtocol {

	var chinese: Chinese { get }
	var totalScore: Int { get }
	var sendBackScore: ((totalScore: Int, newScore: Score) -> Void) { get }

	var blockViews: BlockView { get }
	var scrollView: UIScrollView { get }
	var headerView: HeaderView { get }
	var nextButton: NextButton { get }
	var finalView: FinalView { get }

	var sound: Bool  { get }
	var vibration: Bool { get }

	var rightSound: AVAudioPlayer { get }
	var wrongSound: AVAudioPlayer { get }


	var currentPage: Int  { get }
	var rightScore: Int { get }
	var wrongScore: Int { get }
}

extension TestProtocol where Self: TestViewController {

	var finalView: FinalView { return FinalView() }
}

//class TestViewControllerDelegate: UIViewController, TestProtocol {
//
//	var chinese = Chinese()
//	var totalScore: Int = 0
//	var sendBackScore = { (totalScore, newScore) -> Void in  }
//
//	var blockViews = [BlockView]()
//	var scrollView = UIScrollView()
//	var headerView: HeaderView
//	var nextButton: NextButton
//	var finalView: FinalView
//
//	var sound = true
//	var vibration = true
//
//	var rightSound = AVAudioPlayer()
//	var wrongSound = AVAudioPlayer()
//
//
//	var currentPage = 0
//	var rightScore: Int = 0
//	var wrongScore: Int = 0
//
//
//}