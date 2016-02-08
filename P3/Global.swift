//
//  Global.swift
//  P2
//
//  Created by Bobo on 1/8/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


typealias Group = String
typealias Collection = [String]
typealias Batch = [String]

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

