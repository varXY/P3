//
//  NSArray+removeAtIndexs.swift
//  pages
//
//  Created by Bobo on 1/20/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation

func uniq<S: SequenceType, E: Hashable where E==S.Generator.Element>(source: S) -> [E] {
	var seen: [E:Bool] = [:]
	return source.filter({ (v) -> Bool in
		return seen.updateValue(true, forKey: v) == nil
	})
}

extension Array {

    mutating func removeAtIndexes(incs: [Int]) {
        incs.sort(>).forEach { removeAtIndex($0) }
    }
	
}