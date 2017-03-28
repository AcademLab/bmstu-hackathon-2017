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
fileprivate let kPhoneKey = "phone"

enum UserProfileError : Error {
	case unableToSave
}

protocol UserProfile {
	var name : String? { get }
	var phone : String? { get }
}

class AcademicUserProfile : UserProfile {
	var name : String? = {
		return KeychainSwift().get(kNameKey)
	}()
	var phone : String? = {
		return KeychainSwift().get(kPhoneKey)
	}()
	
	func updateName(_ newName : String) throws {
		guard KeychainSwift().set(newName, forKey: kNameKey) else {
			throw UserProfileError.unableToSave
		}
	}
	func updatePhone(_ newPhone : String) throws {
		guard KeychainSwift().set(newPhone, forKey: kPhoneKey) else {
			throw UserProfileError.unableToSave
		}
	}
	
}
