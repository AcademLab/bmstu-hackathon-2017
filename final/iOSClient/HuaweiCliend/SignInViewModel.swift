//
//  SignInViewModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol SignInViewModel {
	func didEndEntetingCredentials(login : String, password : String)
	weak var delegate : SignInViewModelDelegate? { get set }
}

protocol SignInViewModelDelegate : class {
	func didFailAuth(errorMsg : String)
	func didSuccess()
}

class AcademSignInViewModel : SignInViewModel{
	
	var model : SignInModel
	weak var delegate : SignInViewModelDelegate?
	
	init(model : SignInModel) {
		self.model = model
	}
	
	func didEndEntetingCredentials(login : String, password : String) {
		
		ALKeychainer.sharedInstance.login = login
		ALKeychainer.sharedInstance.password = password
		
		model.authWith(login: ALKeychainer.sharedInstance.login,
		               password: ALKeychainer.sharedInstance.password) {
			
			[unowned self] (token, error) -> (Void) in
			
			guard let token = token, error == nil else {
				self.delegate?.didFailAuth(errorMsg: AcademSignInViewModel.string(from: error))
				return
			}
			
			ALKeychainer.sharedInstance.token = token
			self.delegate?.didSuccess()
		}
	}
	
	// MARK: Fileprivate
	
	fileprivate static func string(from error : SignInError?) -> String {
	
		switch error ?? SignInError.unknown {
		case SignInError.invalidRequest:
			return "Invalid request."
		case SignInError.networkError(let networkError):
			return AcademSignInViewModel.string(from: networkError)
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
	
	fileprivate static func string(from error : UserProfileError?) -> String {
		
		switch error ?? .unknown {
		case .unableToSave:
			return "Unable to save data."
		default:
			return "Unknown error"
		}
	}
}
