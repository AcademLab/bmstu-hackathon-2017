//
//  UserProfile.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import KeychainSwift
import DeviceGuru


fileprivate let kNameKey = "name"
fileprivate let kSurnameKey = "surname"
fileprivate let kPatronicNameKey = "patronicName"
fileprivate let kPhoneKey = "phone"
fileprivate let kLoginKey = "login"


enum UserProfileError : Error {
	case unableToSave
	case unknown
}

protocol UserProfileModel {
	func name() -> String?
	func surname() -> String?
	func patronicName() -> String?
	func login() -> String?
	func phone() -> String?
	func deviceInfo() -> String?
	
	static func isAuthorized() -> Bool
	static func clearData() throws
	
	func updateName(_ newName : String) throws
	func updateSurname(_ newSurname : String) throws
	func updatePatronicName(_ newPatronicName : String) throws
	func updatePhone(_ newPhone : String) throws
	func updateLogin(_ newLogin : String) throws
}

class AcademicUserProfileModel : UserProfileModel {
	func name() -> String? {
		return KeychainSwift().get(kNameKey)
	}
	func surname() -> String? {
		return KeychainSwift().get(kSurnameKey)
	}
	func patronicName() -> String? {
		return KeychainSwift().get(kPatronicNameKey)
	}
	func phone() -> String? {
		return KeychainSwift().get(kPhoneKey)
	}
	func login() ->  String? {
		return KeychainSwift().get(kLoginKey)
	}
	func deviceInfo() ->  String? {
		return DeviceGuru.hardwareString()
	}
	
	static func isAuthorized() -> Bool {
		let model = AcademicUserProfileModel()
		guard let _ = model.name(),
			  let _ = model.surname(),
			  let _ = model.phone(),
			  let _ = model.login() else {
			return false
		}
		
		return true
	}
	static func clearData() throws {
		for key in [kNameKey, kSurnameKey, kPatronicNameKey, kPhoneKey, kLoginKey] {
			guard KeychainSwift().delete(key) else {
				throw UserProfileError.unableToSave
			}
		}
	}
	
	func updateName(_ newName : String) throws {
		guard KeychainSwift().set(newName, forKey: kNameKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
	func updateSurname(_ newSurname : String) throws {
		guard KeychainSwift().set(newSurname, forKey: kSurnameKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updatePatronicName(_ newPatronicName : String) throws {
		guard KeychainSwift().set(newPatronicName, forKey: kPatronicNameKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
	func updatePhone(_ newPhone : String) throws {
		guard KeychainSwift().set(newPhone, forKey: kPhoneKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updateLogin(_ newLogin : String) throws {
		guard KeychainSwift().set(newLogin, forKey: kLoginKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
}
