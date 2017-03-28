//
//  UserProfileViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
	
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var deviceLabel: UILabel!
	
	var viewModel : UserProfilViewModel? = AcademUserProfilViewModel(model: AcademicUserProfileModel())
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupData()
	}
	
	// MARK: Setup data
	
	func setupData() {
		fullNameLabel.text = viewModel?.fullName
		loginLabel.text = viewModel?.login
		phoneLabel.text = viewModel?.phone
		deviceLabel.text = viewModel?.deviceInfo
	}
	
}

