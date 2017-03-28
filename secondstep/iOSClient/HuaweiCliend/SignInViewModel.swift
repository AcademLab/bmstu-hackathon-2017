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
		model.authWith(login: login, password: password) {
			
			[unowned self] (userInfo, error) -> (Void) in
			
			guard let userInfo = userInfo,
				error == nil else {
				self.delegate?.didFailAuth(errorMsg: AcademSignInViewModel.string(from: error))
				return
			}
			debugPrint("success auth \(userInfo)")
			
			let userProfileModel = AcademicUserProfileModel()
			do {
				try userProfileModel.updateName(userInfo.name)
				try userProfileModel.updateSurname(userInfo.surname)
				try userProfileModel.updatePatronicName(userInfo.patrnoicName)
				try userProfileModel.updateLogin(userInfo.login)
				try userProfileModel.updatePhone(userInfo.phone)
				self.delegate?.didSuccess()
			}
			catch let saveError as UserProfileError {
				self.delegate?.didFailAuth(errorMsg: AcademSignInViewModel.string(from: saveError))
			}
			catch {
				self.delegate?.didFailAuth(errorMsg: "Unknown error.")
			}
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
	
	fileprivate static func string(from error : UserProfileError?) -> String {
		
		switch error ?? .unknown {
		case .unableToSave:
			return "Unable to save data."
		default:
			return "Unknown error"
		}
	}
}
