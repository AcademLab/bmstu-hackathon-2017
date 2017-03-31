//
//  String+Hash.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

extension String {
	
	// Encoding
	
	func encoded() -> String {
		return self + "_enconded_general"
	}
	
	func encodedByIMEI() -> String {
		return self + "_enconded_IMEI"
	}
	
	func encoded(byPinCode pincode : String) -> String{
		return self + "encoded_\(pincode)"
	}
	
	// MARK : Decoding
	
	func decoded() -> String {
		return self
	}
	
	func decodedByIMEI() -> String {
		return self
	}
	
	func decoded(byPinCode pincode : String) -> String {
		return self
	}
}
