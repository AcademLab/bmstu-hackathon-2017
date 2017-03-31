//
//  PinCodeViewModel.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

class ALPinCodeViewModel {
	
	var userProfile : UserProfileModel
	var title : String
	var schouldSetPincode : Bool
	
	init(model : UserProfileModel) {
		self.userProfile = model
		
		schouldSetPincode = userProfile.pinCode() ?? false
		title = schouldSetPincode ? "Введите пинкод" : "Установите пинкод"
	}
	
}
