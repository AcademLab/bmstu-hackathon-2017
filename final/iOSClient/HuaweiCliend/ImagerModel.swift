//
//  ImagerModel.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 4/1/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

import SwiftyJSON

fileprivate let kImageSendKey = "setImage"
fileprivate let kImageGetKey = "getImage"
fileprivate let kHostKey = "https://5.101.77.77:8092"
fileprivate let kTokenKey = "token"
fileprivate let kImageKey = "image"
fileprivate let kMsgKey = "message"

typealias ImagerModelCompletion = (String?, ImagerModelError?) -> (Void)

protocol ImagerModel {
	func sendImage(image : String?, token : String, completion : @escaping ImagerModelCompletion)
	func getImage(_ token : String, completion : @escaping ImagerModelCompletion)
}

enum ImagerModelError {
	case unknown
	case unreachable
	case invalidRequest
	case networkError(String, NetworkError?)
	case invalidImage
}

class ALImagerModel : ImagerModel {
	
	func sendImage(image : String?, token : String, completion : @escaping ImagerModelCompletion) {
		guard let image = image else {
			completion(nil, .invalidImage)
			return
		}
		
		let sendImageUrl = url(forKey: kImageSendKey)
		let json: [String: Any] = [kTokenKey: "",
		                           kImageKey: image ]
		
		guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
			completion(.none, .invalidRequest)
			return
		}
		
		Network().sendRequest(url: sendImageUrl, jsonData: jsonData, token : token) { (JSONData, error) -> (Void) in

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
			
			guard let image = json[kImageKey].string else {
				completion(.none, .networkError(errMsg, .invalidRequest) )
				return
			}
			
			completion(image, nil)
		}
	}
	func getImage(_ token : String, completion : @escaping ImagerModelCompletion) {
		let getImagehUrl = url(forKey: kImageGetKey)
		Network().sendRequest(url: getImagehUrl, token: token) { (JSONData, error) -> (Void) in
			
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
			
			guard let image = json[kImageKey].string else {
				completion(.none, .networkError(errMsg, .invalidRequest) )
				return
			}
			
			completion(image, nil)
		}
	}
	
	
	// MARK: Private
	
	fileprivate func url(forKey key : String) -> String {
		return "\(kHostKey)/\(key)"
	}
	
}

class MockImagerModel : ImagerModel {
	func getImage(_ token: String, completion: @escaping ImagerModelCompletion) {
		completion(#imageLiteral(resourceName: "test").base64(), nil)
	}

	func sendImage(image : String?, token : String, completion : @escaping ImagerModelCompletion) {
		
		completion(#imageLiteral(resourceName: "test").base64(), nil)
		
	}
}
