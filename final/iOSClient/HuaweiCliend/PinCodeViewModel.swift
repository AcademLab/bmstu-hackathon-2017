//
//  PinCodeViewModel.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import Dispatch

protocol PinCodeViewModelDelegate : class {
	func didFailPincodeVerification(withErrMsg errMsg : String)
	func didSuccess(withMsg msg : String)
}

protocol PinCodeViewModel {
	
	weak var delegate : PinCodeViewModelDelegate? { get set }
	var title : String  { get }
	var schouldSetPincode : Bool { get }
	
	func verifyPinCode( _ pincode : String )
	
}

class ALPinCodeViewModel : PinCodeViewModel {
	
	weak internal var delegate: PinCodeViewModelDelegate?
	
	var userProfile : UserProfileModel
	var title : String
	var schouldSetPincode : Bool
	
	fileprivate var pinCodeattemps = 5
	fileprivate let pinCodeLength = 5
	
	init(model : UserProfileModel) {
		self.userProfile = model
		
		schouldSetPincode = userProfile.pinCode() == nil
		title = schouldSetPincode ? "Установите пинкод" : "Введите пинкод"
	}
	
	func verifyPinCode( _ pincode : String ) {
		guard pincode.characters.count == pinCodeLength else {
			return
		}
		
		guard pinCodeattemps > 0 else {
			self.delegate?.didFailPincodeVerification(withErrMsg: "Попыток больше не осталось 😕")
			return
		}
		
		if schouldSetPincode {
			
			let login = ALKeychainer.sharedInstance.login
			let password = ALKeychainer.sharedInstance.password
			let token = ALKeychainer.sharedInstance.token
			
			try? self.userProfile.updateLogin(login.encodedByIMEI().encoded(byPinCode: pincode))
			try? self.userProfile.updatePassword(password.encodedByIMEI().encoded(byPinCode: pincode))
			try? self.userProfile.updateToken(token.encodedByIMEI().encoded(byPinCode: pincode))
			try? self.userProfile.updatePincode(pincode)
			
			
			DispatchQueue.main.async {
				ALRouter.sharedInstance.finishedAuth()
			}
		
			return
		}
		
		guard userProfile.pinCode() == pincode else {
			pinCodeattemps -= 1
			self.delegate?.didFailPincodeVerification(withErrMsg: "Неверный пинкод 😝. Осталось попыток \(pinCodeattemps)")
			return
		}
		
		//TODO: decoding and server login
		
		DispatchQueue.main.async {
			ALRouter.sharedInstance.finishedAuth()
		}
	}
	
}
