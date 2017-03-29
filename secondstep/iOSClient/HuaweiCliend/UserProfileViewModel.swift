//
//  UserProfileViewModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol UserProfilViewModel {
	var fullName : String { get }
	var login: String { get }
	var phone : String { get }
	var deviceInfo: String { get }
}

class AcademUserProfilViewModel : UserProfilViewModel {
	let model : UserProfileModel
	
	var fullName : String
	var login: String
	var phone : String
	var deviceInfo: String
	
	init(model : UserProfileModel) {
		self.model = model
		
		let name = model.name() ?? "Undefined"
		let surname = model.surname() ?? "Undefined"
		let patronicName = model.patronicName() ?? "Undefined"
		
		self.fullName = "\(name) \(patronicName) \(surname)"
		self.login = model.login() ?? "Undefined"
		self.phone = model.phone() ?? "Undefined"
		self.deviceInfo = model.deviceInfo() ?? "Undefined"
	}
	
}
