//
//  String+Hash.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import SwiftHash

extension String {
	
	// Encoding
	
	public func encoded() -> String {
		return MD5(self)
	}
	
	public func cryptedByIMEI() -> String {
		return self + "_enconded_IMEI"
	}
	
	public func crypted(byPinCode pincode : String) -> String{
		return self + "encoded_\(pincode)"
	}
	
	// MARK : Decoding
	
	public func decryptedByIMEI() -> String {
		return self
	}
	
	public func decrypted(byPinCode pincode : String) -> String {
		return self
	}
}
