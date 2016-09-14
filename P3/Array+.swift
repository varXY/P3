//
//  NSArray+removeAtIndexs.swift
//  pages
//
//  Created by Bobo on 1/20/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation

func uniq<S: Sequence, E: Hashable>(_ source: S) -> [E] where E==S.Iterator.Element {
	var seen: [E:Bool] = [:]
	return source.filter({ (v) -> Bool in
		return seen.updateValue(true, forKey: v) == nil
	})
}

extension Array {

    mutating func removeAtIndexes(_ incs: [Int]) {
        incs.sorted(by: >).forEach { remove(at: $0) }
    }
	
}
