//
//  UIViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class AcademViewController : UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	func setup() {
		setupGestures()
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
	
	// MARK: Gesturns
	
	func setupGestures() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		self.view.addGestureRecognizer(tap)
	}
	
	// MARK: Keyboard
	
	@objc func dismissKeyboard() {
		self.view.endEditing(true)
	}
	
}
