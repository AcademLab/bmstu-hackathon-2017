//
//  SignInModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let kAuthKey = "authenticate"
fileprivate let kHostKey = "http://212.116.121.122:8080"
fileprivate let kLoginKey = "login"
fileprivate let kPasswordKey = "password"
fileprivate let kTokenKey = "token"

typealias SignInCompletion = (String?, SignInError?) -> (Void)

protocol SignInModel {
	func authWith(login : String, password : String, completion : @escaping SignInCompletion)
}

enum SignInError {
	case unknown
	case invalidRequest
	case networkError(NetworkError?)
}

class AcademSignInModel : SignInModel {
	
	func authWith(login : String, password : String, completion : @escaping SignInCompletion) {
		let authUrl = url(forKey: kAuthKey)
		
		let json: [String: Any] = [kLoginKey: login,
		                           kPasswordKey: password.encoded() ]
		
		guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
			completion(.none, .invalidRequest)
			return
		}
		
		Network.sendRequest(url: authUrl, jsonData: jsonData) { (JSONData, error) -> (Void) in
			guard let JSONData = JSONData else {
				completion(.none, .networkError( .unreachable ) )
				return
			}
			if let error = error {
				completion(.none, .networkError( error ))
				return
			}
			
			let json = JSON(JSONData)
			guard let token = json[kTokenKey].string else {
				completion(.none, .networkError(.invalidRequest) )
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
