//
//  SupportProducts.swift
//  P3
//
//  Created by 文川术 on 2/23/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation


// Use enum as a simple namespace.  (It has no cases so you can't instantiate it.)
public enum SupportProducts {

	/// TODO:  Change this to whatever you set on iTunes connect
	fileprivate static let Prefix = "com.xiaoyao.PinyinComparison."

	/// MARK: - Supported Product Identifiers
	public static let SupportOne = Prefix + "SupportOne"
	public static let SupportTwo          = Prefix + "SupportTwo"
	public static let SupportThree         = Prefix + "SupportThree"


	// All of the products assembled into a set of product identifiers.
	fileprivate static let productIdentifiers: Set<ProductIdentifier> = [
		SupportProducts.SupportOne,
		SupportProducts.SupportTwo,
		SupportProducts.SupportThree]

	/// Static instance of IAPHelper that for rage products.
	public static let store = IAPHelper(productIdentifiers: SupportProducts.productIdentifiers)
}

/// Return the resourcename for the product identifier.
func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
	return productIdentifier.components(separatedBy: ".").last
}
