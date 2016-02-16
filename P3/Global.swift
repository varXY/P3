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

enum DuadType {
    case Same
    case Different
}

enum AnimationType {
    case Appear
    case Disappear
    case Touched
    case IsRightAnswer
    case Other
}

struct Defaults {
	static let sound = "Sound"
	static let C_amount = "C_amount"
}

struct Titles {
	static let next = ">"
	static let done = "Done"
	static let homepageBigButtons = ["SAME OR DIFFERENT", "SELECT THE SAME", "SPELL IT"]
	static let homepageSmallButtons = ["Records", "Settings"]
	static let sameOrNot = ["Same", "Different"]
}

struct BlockWidth {
	static let homepage: CGFloat = (ScreenWidth - 60) / 2
	static let sameOrNot: CGFloat = (ScreenWidth - 60) / 2
	static let selectTheSame: CGFloat = (ScreenHeight - 240) / 3
	static let spell: CGFloat = ScreenHeight / 2 - 60
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


