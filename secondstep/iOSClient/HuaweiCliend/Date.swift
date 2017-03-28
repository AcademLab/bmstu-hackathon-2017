//
//  Date.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

extension Date {
	func formattedDate() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy/mm/ee HH:mm:ss"
		let timeStamp = dateFormatter.string(from: self)
		return timeStamp
	}
}
