//
//  Chinese+.swift
//  P3
//
//  Created by 文川术 on 2/25/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


extension Chinese {

	func charactersFromPinyin(pinyin: String) -> [String] {
		let index = pinyin.startIndex.advancedBy(0)
		let letter = String(pinyin[index])

		switch letter {
		case "a": let result = Struct_A(pinyin: pinyin); return result.characters
		case "b": let result = Struct_B(pinyin: pinyin); return result.characters
		case "c": let result = Struct_C(pinyin: pinyin); return result.characters
		case "d": let result = Struct_D(pinyin: pinyin); return result.characters
		case "e": let result = Struct_E(pinyin: pinyin); return result.characters
		case "f": let result = Struct_F(pinyin: pinyin); return result.characters
		case "g": let result = Struct_G(pinyin: pinyin); return result.characters
		case "h": let result = Struct_H(pinyin: pinyin); return result.characters
		case "j": let result = Struct_J(pinyin: pinyin); return result.characters
		case "k": let result = Struct_K(pinyin: pinyin); return result.characters
		case "l": let result = Struct_L(pinyin: pinyin); return result.characters
		case "m": let result = Struct_M(pinyin: pinyin); return result.characters
		case "n": let result = Struct_N(pinyin: pinyin); return result.characters
		case "o": let result = Struct_O(pinyin: pinyin); return result.characters
		case "p": let result = Struct_P(pinyin: pinyin); return result.characters
		case "q": let result = Struct_Q(pinyin: pinyin); return result.characters
		case "r": let result = Struct_R(pinyin: pinyin); return result.characters
		case "s": let result = Struct_S(pinyin: pinyin); return result.characters
		case "t": let result = Struct_T(pinyin: pinyin); return result.characters
		case "w": let result = Struct_W(pinyin: pinyin); return result.characters
		case "x": let result = Struct_X(pinyin: pinyin); return result.characters
		case "y": let result = Struct_Y(pinyin: pinyin); return result.characters
		case "z": let result = Struct_Z(pinyin: pinyin); return result.characters
		default: return ["wrong"]
		}
	}


}