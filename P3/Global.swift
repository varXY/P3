//
//  Global.swift
//  P2
//
//  Created by Bobo on 1/8/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


let ScreenBounds = UIScreen.main.bounds
let ScreenWidth = ScreenBounds.width
let ScreenHeight = ScreenBounds.height

let BarHeight = UIApplication.shared.statusBarFrame.height
let AppStoreLink = "https://itunes.apple.com/cn/app/pinyin-comparison/id1086816660?l=en&mt=8"
let iTunesViewLink = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1086816660&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"

let dateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "MM/dd/yy"
	return formatter
}()

var priceFormatter: NumberFormatter = {
	let pf = NumberFormatter()
	pf.formatterBehavior = .behavior10_4
	pf.numberStyle = .currency
	return pf
}()

enum AnimationType {
    case appear, disappear, touched, isRightAnswer, bigger, becomeVisble, other
}

struct Defaults {
	static let sound = "Sound"
	static let vibration = "Vibration"
	static let pronunciations = "Pronunciations"
	static let C_amount = "C_amount"
	static let SpellStyle = "SpellStyle"
}

struct Time {
	static let toNextPageWaitingTime: Double = 0.4
}

struct Titles {
	static let confirm = NSLocalizedString("Confirm", comment: "NextButton")
	static let done = NSLocalizedString("Done", comment: "NextButton")
	static let homepageBigButtons = [
		NSLocalizedString("SAME OR NOT", comment: "HomepageVC"),
		NSLocalizedString("SELECT THE SAME", comment: "HomepageVC"),
		NSLocalizedString("SPELL IT", comment: "HomepageVC")
	]
	static let sameOrNot = [
		NSLocalizedString("Same", comment: "SameOrNotVC"),
		NSLocalizedString("Different", comment: "SameOrNotVC")
	]
	static let finalChoices = [
		NSLocalizedString("Again", comment: "FinalView"),
		NSLocalizedString("Quit", comment: "FinalView")
	]
	static let noRecords = NSLocalizedString("No Record", comment: "RecordVC")
	
}

struct ImageName {
	static let Back = "Back"
	static let Next = "Next"
	static let Record = "Record"
	static let Setting = "Setting"
	static let Smile = "Smile"
}

struct BlockWidth {
	static let homepage: CGFloat = (ScreenWidth - 60) / 2
	static let sameOrNot: CGFloat = (ScreenWidth - 60) / 2 + 4
	static let selectTheSame: CGFloat = {
		if ScreenHeight == 480 {
			return (ScreenHeight - 140) / 3
		} else {
			return (ScreenHeight - 240) / 3
		}
	}()
	static let spell: CGFloat = ScreenHeight / 2 - 80
}

//func getIndexArrayFromAmount(amount: Int) -> [Int] {
//	var array = [0]
//	repeat {
//		array.append(array[array.count - 1] + 1)
//	} while array.count < amount
//	return amount == 1 ? [0] : array
//}


func delay(seconds: Double, completion:@escaping ()->()) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}

func getRandomNumbers(_ amount: Int, lessThan: Int) -> [Int] {
    var result = [Int]()

	if lessThan <= 1 {
		result = [0]
	} else {
		repeat {
			let range = UInt32(lessThan)
			let number = Int(arc4random_uniform(range))
			result.append(number)
			result = uniq(result)
		} while result.count < amount
	}

    return result
}

func alertOfStayOrQuit(_ viewController: UIViewController, title: String, message: String, quit: @escaping (() -> ())) {
	let quitTitle = NSLocalizedString("Quit", comment: "FinalView")
	let resumeTitle = NSLocalizedString("Resume", comment: "TestVC")
	let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
	let action = UIAlertAction(title: quitTitle, style: .default, handler: ({ _ in quit() }))
	let action1 = UIAlertAction(title: resumeTitle, style: .default, handler: nil)
	alert.addAction(action)
	alert.addAction(action1)
	viewController.present(alert, animated: true, completion: nil)
}


