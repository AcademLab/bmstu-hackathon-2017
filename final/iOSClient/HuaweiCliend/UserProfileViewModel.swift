//
//  UserProfileViewModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol UserProfilViewModel {
}

class AcademUserProfilViewModel : UserProfilViewModel {
	let model : UserProfileModel
	init(model : UserProfileModel) {
		self.model = model
	}
	
}
