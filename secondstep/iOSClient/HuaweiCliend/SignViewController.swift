//
//  SignViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/27/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class SignViewController: AcademViewController, UITextFieldDelegate, SignInViewModelDelegate {
	
	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	var viewModel : SignInViewModel?
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		setup()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	// MARK : Setup (TEMP)
	
	override func setup() {
		super.setup()
		self.viewModel = AcademSignInViewModel(model: MockSignInModel())
		self.viewModel?.delegate = self
	}
	
	// MARK : Actions
	@IBAction func didTappedInSignIn(_ sender: Any) {
		guard let login = loginField.text,
			let password = passwordField.text,
			!login.isEmpty,
			!password.isEmpty else {
			showMessage("Заполните все поля 😡")
			return
		}
			
		viewModel?.didEndEntetingCredentials(login: login, password: password)
		dismissKeyboard()
	}
	
	// MARK: UITextFieldDelegate
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		dismissKeyboard()
		return false
	}
	
	// MARK : SignInViewModelDelegate
	
	func didFailAuth(errorMsg: String) {
		showMessage(errorMsg)
	}
	
	func didSuccess() {
		self.dismiss(animated: true, completion: nil)
	}
}
