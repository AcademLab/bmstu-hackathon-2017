//
//  UserProfileViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class UserProfileViewController: AcademViewController {
	
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var deviceLabel: UILabel!
	
	var viewModel : UserProfilViewModel? = AcademUserProfilViewModel(model: ALUserProfileModel())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		ALRouter.sharedInstance.showAuth()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func setup() {
		self.title = "User Profile"
	}
	
}

