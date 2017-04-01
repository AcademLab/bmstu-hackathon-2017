//
//  ImagerModelView.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 4/1/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol ImagerViewModel {
	func didSendImage( _ image : String?)
	func didRequestImage()
	weak var delegate : ImagerViewModelDelegate? { get set }
}

protocol ImagerViewModelDelegate : class {
	func didFailImageSending(errorMsg : String)
	func didSuccess(withImage image : String)
}

class ALImagerViewModel : ImagerViewModel{
	
	var userInfo : UserProfileModel = ALUserProfileModel()
	var model : ImagerModel
	weak var delegate : ImagerViewModelDelegate?
	
	init(model : ImagerModel) {
		self.model = model
	}
	
	func didSendImage( _ image : String?) {
		
		debugPrint("IMAGE LENGTH: \(image?.characters.count)")
		
		guard let pincodeData = userInfo.pinCode(),
			  let pincode = try? pincodeData.decryptedByIMEI(),
			  let tokenData =  userInfo.token(),
			  let token = try? tokenData.decrypted(byPinCode: pincode ) else {
			return
		}
		
		model.sendImage(image: image, token: token) {
			[unowned self] (image, error) -> (Void) in
			if let error = error {
				self.delegate?.didFailImageSending(errorMsg: ALImagerViewModel.string(from: error))
				return
			}
			
			guard let image = image else {
				self.delegate?.didFailImageSending(errorMsg: ALImagerViewModel.string(from: ImagerModelError.unknown))
				return
			}
			
			self.delegate?.didSuccess(withImage: image)
		}
	}
	
	
	func didRequestImage() {
		guard let pincodeData = userInfo.pinCode(),
			let pincode = try? pincodeData.decryptedByIMEI(),
			let tokenData =  userInfo.token(),
			let token = try? tokenData.decrypted(byPinCode: pincode ) else {
				return
		}
		
		model.getImage(token) {
			[unowned self] (image, error) -> (Void) in
			if let error = error {
				self.delegate?.didFailImageSending(errorMsg: ALImagerViewModel.string(from: error))
				return
			}
			
			guard let image = image else {
				self.delegate?.didFailImageSending(errorMsg: ALImagerViewModel.string(from: ImagerModelError.unknown))
				return
			}
			
			self.delegate?.didSuccess(withImage: image)
		}
	}
	
	
	// MARK: Fileprivate
	
	fileprivate static func string(from error : ImagerModelError?) -> String {
		
		switch error ?? ImagerModelError.unknown {
		case ImagerModelError.invalidRequest:
			return "Invalid request."
		case ImagerModelError.networkError(let errMsg, _):
			return errMsg
		//			return ALImagerViewModel.string(from: networkError)
		default:
			return "Unknown error"
		}
	}
	
	fileprivate static func string(from error : NetworkError?) -> String {
		
		switch error ?? NetworkError.unknown {
		case NetworkError.failedRequest:
			return "Failed request."
		case NetworkError.unauthorized:
			return "Invalid credentials."
		case NetworkError.unreachable:
			return "Network is unreachable."
		case NetworkError.invalidRequest:
			return "Invalid request."
		default:
			return "Unknwon network error"
		}
		
	}
}
