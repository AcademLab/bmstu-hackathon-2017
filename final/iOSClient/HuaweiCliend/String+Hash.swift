//
//  String+Hash.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import SwiftHash
import RNCryptor

enum CryptError : Error {
	case unableToCrypt
	case unableToDecrypt
}

extension String {
	
	// Encoding
	
	public func encoded() -> String {
		return MD5(self)
	}
	
	public func cryptedByIMEI() throws -> Data {
		guard let data = self.data(using: .utf8) else {
			throw CryptError.unableToCrypt
		}
		
		return RNCryptor.encrypt(data: data, withPassword: Device.IMEI() )
	}
	
	public func crypted(byPinCode pincode : String) throws -> Data {
		guard let data = self.data(using: .utf8) else {
			throw CryptError.unableToCrypt
		}
		
		return RNCryptor.encrypt(data: data, withPassword: pincode)
	}
}

extension Data {
	
	// MARK : Decoding
	
	public func decryptedByIMEI() throws -> String {
		guard let originalData = try? RNCryptor.decrypt(data: self, withPassword: Device.IMEI()),
			let string = String(data: originalData, encoding: .utf8) else {
				throw CryptError.unableToDecrypt
		}
		
		return string
	}
	
	public func decrypted(byPinCode pincode : String) throws -> String {
		
		guard let originalData = try? RNCryptor.decrypt(data: self, withPassword: pincode),
			let string = String(data: originalData, encoding: .utf8) else {
			throw CryptError.unableToDecrypt
		}
		
		return string
		
	}
}

