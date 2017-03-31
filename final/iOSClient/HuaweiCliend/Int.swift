//
//  Int.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

extension Int {
	static func random(range: Range<UInt32>) -> Int {
		return Int(range.lowerBound + arc4random_uniform(range.upperBound - range.lowerBound))
	}
}
