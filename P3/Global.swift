//
//  Global.swift
//  P2
//
//  Created by Bobo on 1/8/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


let ScreenBounds = UIScreen.mainScreen().bounds
let ScreenWidth = ScreenBounds.width
let ScreenHeight = ScreenBounds.height

let BarHeight = UIApplication.sharedApplication().statusBarFrame.height

let dateFormatter: NSDateFormatter = {
	let formatter = NSDateFormatter()
	formatter.dateFormat = "MM/dd/yy"
	return formatter
}()

var priceFormatter: NSNumberFormatter = {
	let pf = NSNumberFormatter()
	pf.formatterBehavior = .Behavior10_4
	pf.numberStyle = .CurrencyStyle
	return pf
}()

enum Outcome {
	case Right, Wrong

	var color: UIColor {
		switch self {
		case .Right: return UIColor.rightGreen()
		case .Wrong: return UIColor.wrongRed()
		}
	}
}
enum AnimationType {
    case Appear
    case Disappear
    case Touched
    case IsRightAnswer
	case Bigger
	case BecomeVisble
    case Other
}

struct Defaults {
	static let sound = "Sound"
	static let vibration = "Vibration"
	static let pronunciations = "Pronunciations"
	static let C_amount = "C_amount"
}

struct Time {
	static let outcomeStayTime: Double = 0.3
	static let toNextPageWaitingTime: Double = 0.4
}

struct Titles {
	static let next = ">"
	static let confirm = "Confirm"
	static let done = "Done"
	static let completed = "Completed"
	static let homepageBigButtons = ["SAME OR NOT", "SELECT THE SAME", "SPELL IT"]
	static let homepageSmallButtons = ["Records", "Settings"]
	static let sameOrNot = ["Same", "Different"]
	static let finalChoices = ["Again", "Quit"]
	static let settingTitles = ["Sound", "Vibration", "Number of wheels to spell with", "Include uncommon pinyin", "Feedback", "Contribute"]
	static let noRecords = "No Records"
	static let notFinished = "Haven't Finished Yet"
	static let warming = "If you quit, current score will be lost."
}

struct ImageName {
	static let Back = "Back"
	static let Next = "Next"
	static let Record = "Record"
	static let Setting = "Setting"
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

func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
    
}

func getRandomNumbers(amount: Int, lessThan: Int) -> [Int] {
    var result = [Int]()
    
    repeat {
        let range = UInt32(lessThan)
        let number = Int(arc4random_uniform(range))
        if let sameAtIndex = result.indexOf(number) {
            result.removeAtIndex(sameAtIndex)
        }
        result.append(number)
    } while result.count < amount
    
    return result
}

func alertOfStayOrQuit(viewController: UIViewController, title: String, message: String, quit: (() -> ())) {
	let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
	let action = UIAlertAction(title: "Quit", style: .Default, handler: ({ _ in quit() }))
	let action1 = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
	alert.addAction(action)
	alert.addAction(action1)
	viewController.presentViewController(alert, animated: true, completion: nil)
}


