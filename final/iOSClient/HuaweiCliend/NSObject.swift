//
//  NSObject.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

extension NSObject {
	var className: String {
		return String(describing: type(of: self))
	}
	
	class var className: String {
		return String(describing: self)
	}
}
