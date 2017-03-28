//
//  SignViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/27/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class SignViewController: UIViewController, UITextFieldDelegate, SignInViewModelDelegate {
	
	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	var viewModel : SignInViewModel?
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		setup()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupGestures()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	// MARK : Setup (TEMP)
	
	func setup() {
		self.viewModel = AcademSignInViewModel(model: AcademSignInModel())
		self.viewModel?.delegate = self
	}
	
	// MARK: Gesturns
	
	func setupGestures() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		self.view.addGestureRecognizer(tap)
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
	
	// MARK: Keyboard
	
	@objc fileprivate func dismissKeyboard() {
		self.view.endEditing(true)
	}
	
	// MARK: Message
	
	func showMessage(_ msg : String) {
		let alertController = UIAlertController(title: "",
		                                        message: msg,
		                                        preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: "OK", style: .default) {
			(result : UIAlertAction) -> Void in
		}
		
		alertController.addAction(defaultAction)
		
		present(alertController, animated: true, completion: nil)
	}
}
