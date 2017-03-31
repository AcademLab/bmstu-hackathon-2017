//
//  UserProfile.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import KeychainSwift

fileprivate let kLoginKey = "login"
fileprivate let kPasswordKey = "password"
fileprivate let kTokenKey = "token"
fileprivate let kPinCodeKey = "pincode"


enum UserProfileError : Error {
	case unableToSave
	case unknown
}

protocol UserProfileModel {
	func login() -> Data?
	func password() -> Data?
	func token() -> Data?
	func pinCode() -> Data?
	
	static func isAuthorized() -> Bool
	static func clearData() throws
	
	func updateLogin(_ newLogin : Data) throws
	func updatePassword(_ newPassword : Data) throws
	func updateToken(_ newToken : Data) throws
	func updatePincode(_ pinCode : Data) throws
}

class ALUserProfileModel : UserProfileModel {
	func login() -> Data? {
		return KeychainSwift().getData(kLoginKey)
	}
	func password() -> Data? {
		return KeychainSwift().getData(kPasswordKey)
	}
	func token() ->  Data? {
		return KeychainSwift().getData(kTokenKey)
	}
	func pinCode() -> Data? {
		return KeychainSwift().getData(kPinCodeKey)
	}
	
	static func isAuthorized() -> Bool {
		let model = ALUserProfileModel()
		guard let _ = model.login(),
			  let _ = model.password(),
			  let _ = model.token() else {
			return false
		}
		
		return true
	}
	
	
	static func clearData() throws {
		for key in [kLoginKey, kPasswordKey, kTokenKey, kPinCodeKey] {
			guard KeychainSwift().getData(key) != nil else {
				continue
			}
			
			guard KeychainSwift().delete(key) else {
				throw UserProfileError.unableToSave
			}
		}
	}
	
	func updateLogin(_ newLogin : Data) throws {
		guard KeychainSwift().set(newLogin, forKey: kLoginKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
	func updatePassword(_ newPassword : Data) throws {
		guard KeychainSwift().set(newPassword, forKey: kPasswordKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updateToken(_ newToken : Data) throws {
		guard KeychainSwift().set(newToken, forKey: kTokenKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updatePincode(_ pinCode : Data) throws {
		guard KeychainSwift().set(pinCode, forKey: kPinCodeKey) else {
			throw UserProfileError.unableToSave
		}
	}

}
