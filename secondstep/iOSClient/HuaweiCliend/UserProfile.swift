//
//  UserProfile.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import KeychainSwift

fileprivate let kNameKey = "name"
fileprivate let kSurnameKey = "surname"
fileprivate let kPatronicNameKey = "patronicName"
fileprivate let kPhoneKey = "phone"
fileprivate let kLoginKey = "login"


enum UserProfileError : Error {
	case unableToSave
}

protocol UserProfileModel {
	var name : String? { get }
	var surname : String? { get }
	var patronicName : String? { get }
	var login : String? { get }
	var phone : String? { get }
	var deviceInfo : String? { get }
	
	func updateName(_ newName : String) throws
	func updateSurname(_ newSurname : String) throws
	func updatePatronicName(_ newPatronicName : String) throws
	func updatePhone(_ newPhone : String) throws
	func updateLogin(_ newLogin : String) throws
}

class AcademicUserProfileModel : UserProfileModel {
	var name : String? = {
		return KeychainSwift().get(kNameKey)
	}()
	var surname : String? = {
		return KeychainSwift().get(kSurnameKey)
	}()
	var patronicName : String? = {
		return KeychainSwift().get(kPatronicNameKey)
	}()
	var phone : String? = {
		return KeychainSwift().get(kPhoneKey)
	}()
	var login : String? = {
		return KeychainSwift().get(kLoginKey)
	}()
	var deviceInfo: String? = {
		return "TEST DEVICE"
	}()
	
	func updateName(_ newName : String) throws {
		guard KeychainSwift().set(newName, forKey: kNameKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
	func updateSurname(_ newSurname : String) throws {
		guard KeychainSwift().set(newSurname, forKey: kPatronicNameKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updatePatronicName(_ newPatronicName : String) throws {
		guard KeychainSwift().set(newPatronicName, forKey: kNameKey) else {
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
