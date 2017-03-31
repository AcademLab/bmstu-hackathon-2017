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
	func login() -> String?
	func password() -> String?
	func token() -> String?
	func pinCode() -> Bool?
	
	static func isAuthorized() -> Bool
	static func clearData() throws
	
	func updateLogin(_ newLogin : String) throws
	func updatePassword(_ newPassword : String) throws
	func updateToken(_ newToken : String) throws
	func updatePincode(_ pinCodeFlag : Bool) throws
}

class ALUserProfileModel : UserProfileModel {
	func login() -> String? {
		return KeychainSwift().get(kLoginKey)
	}
	func password() -> String? {
		return KeychainSwift().get(kPasswordKey)
	}
	func token() ->  String? {
		return KeychainSwift().get(kLoginKey)
	}
	func pinCode() -> Bool? {
		return KeychainSwift().getBool(kPinCodeKey)
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
		for key in [kLoginKey, kPasswordKey, kTokenKey] {
			guard KeychainSwift().delete(key) else {
				throw UserProfileError.unableToSave
			}
		}
	}
	
	func updateLogin(_ newLogin : String) throws {
		guard KeychainSwift().set(newLogin, forKey: kLoginKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
	func updatePassword(_ newPassword : String) throws {
		guard KeychainSwift().set(newPassword, forKey: kPasswordKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updateToken(_ newToken : String) throws {
		guard KeychainSwift().set(newToken, forKey: kTokenKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updatePincode(_ pinCodeFlag : Bool) throws {
		guard KeychainSwift().set(pinCodeFlag, forKey: kPinCodeKey) else {
			throw UserProfileError.unableToSave
		}
	}

}
