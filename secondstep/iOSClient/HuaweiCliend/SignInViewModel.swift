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
}

class AcademSignInViewModel : SignInViewModel{
	
	var model : SignInModel
	weak var delegate : SignInViewModelDelegate?
	
	init(model : SignInModel) {
		self.model = model
	}
	
	func didEndEntetingCredentials(login : String, password : String) {
		model.authWith(login: login, password: password) { [unowned self] (userInfo, error) -> (Void) in
			guard error == nil else {
				self.delegate?.didFailAuth(errorMsg: AcademSignInViewModel.string(from: error))
				return
			}
			
			debugPrint("success auth \(userInfo)")
		}
	}
	
	// MARK: Fileprivate
	
	fileprivate static func string(from error : NetworkError?) -> String {
	
		switch error ?? NetworkError.unknown {
		case NetworkError.unreachable():
			return "Network is unreachable."
		case NetworkError.invalidRequest:
			return "Invalid server response."
		case NetworkError.failedRequest:
			return "Failed request."
		case NetworkError.unauthorized:
			return "Invalid credentials."
		default:
			return "Unknown error"
		}
	}
}
