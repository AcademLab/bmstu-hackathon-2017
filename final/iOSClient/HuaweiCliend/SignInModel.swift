//
//  SignInModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let kAuthKey = "auth"
fileprivate let kHostKey = "https://5.101.77.77:8090"
fileprivate let kLoginKey = "login"
fileprivate let kPasswordKey = "passwordHash"
fileprivate let kTokenKey = "token"
fileprivate let kMsgKey = "message"

typealias SignInCompletion = (String?, SignInError?) -> (Void)

protocol SignInModel {
	func authWith(login : String, password : String, completion : @escaping SignInCompletion)
}

enum SignInError {
	case unknown
	case unreachable
	case invalidRequest
	case networkError(String, NetworkError?)
}

class AcademSignInModel : SignInModel {
	
	func authWith(login : String, password : String, completion : @escaping SignInCompletion) {
		let authUrl = url(forKey: kAuthKey)
		
		let json: [String: Any] = [kLoginKey: login,
		                           kPasswordKey: password ]
		
		guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
			completion(.none, .invalidRequest)
			return
		}
		
		Network().sendRequest(url: authUrl, jsonData: jsonData) { (JSONData, error) -> (Void) in
			
			guard let JSONData = JSONData else {
				completion(.none, .unreachable )
				return
			}
			let json = JSON(JSONData)
			let errMsg = json[kMsgKey].string ?? ""
			
			if let error = error {
				completion(.none, .networkError(errMsg, error ))
				return
			}
			
			guard let token = json[kTokenKey].string else {
				completion(.none, .networkError(errMsg, .invalidRequest) )
				return
			}
			
			completion(token, nil)
		}
	}
	
	// MARK: Private
	
	fileprivate func url(forKey key : String) -> String {
		return "\(kHostKey)/\(key)"
	}
	
}

class MockSignInModel : SignInModel {
	func authWith(login : String, password : String, completion : @escaping SignInCompletion) {
		
		completion("oHyn2yO1", nil)
		
	}
	
	
}
