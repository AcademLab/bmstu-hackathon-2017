//
//  SignInModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let kAuthKey = "getProfile"
fileprivate let kHostKey = "http://212.116.121.122:8080"

fileprivate let kNameKey = "name"
fileprivate let kSurnameKey = "surname"
fileprivate let kPatronicName = "patronicName"
fileprivate let kPhone = "phone"

typealias SignInCompletion = (UserInfo?, NetworkError?) -> (Void)

protocol SignInModel {
	func authWith(login : String, password : String, completion : @escaping SignInCompletion)
}

struct UserInfo {
	var name : String
	var surname : String
	var patrnoicName : String
	var login : String
	var phone : String
}

class AcademSignInModel : SignInModel {
	func authWith(login : String, password : String, completion : @escaping SignInCompletion) {
		let authUrl = url(forKey: kAuthKey)
		let json: [String: Any] = ["login": login, "password": password]
		guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
			return
		}
		
		
		Network.sendRequest(url: authUrl, jsonData: jsonData) { (JSONData, error) -> (Void) in
			
			guard error == nil else {
				completion(.none, error)
				return
			}
			
			guard let JSONData = JSONData else {
				completion(.none, NetworkError.unreachable)
				return
			}
			
			let json = JSON(JSONData)
			guard let name = json[kNameKey].string,
				let surname = json[kSurnameKey].string,
				let patronicName = json[kPatronicName].string,
				let phone = json[kPhone].string else {
				completion(.none, NetworkError.invalidRequest)
				return
			}
			
			completion(UserInfo(name: name, surname: surname, patrnoicName: patronicName, login : login, phone: phone), nil)
		}
	}
	
	// MARK: Private
	
	fileprivate func url(forKey key : String) -> String {
		return "\(kHostKey)/\(key)"
	}
	
}

class MockSignInModel : SignInModel {
	func authWith(login : String, password : String, completion : @escaping SignInCompletion) {
		
		completion(UserInfo(name: "Amin", surname: "Benarieb", patrnoicName: "Abdenasser", login : "aminbenarieb", phone: "8 999 966 09 73"), nil)
		
	}
	
	
}
