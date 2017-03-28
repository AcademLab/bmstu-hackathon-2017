//
//  Router.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class AcadeomRouter {

	var tabbarController : UITabBarController?
	
	static let sharedInstance = AcadeomRouter()
	
	func showAuth() {
		if !AcademicUserProfileModel.isAuthorized() {
			guard let svc = SignViewController.instantiate(withClass: SignViewController.className) else {
				return
			}
			
			tabbarController?.selectedViewController?.present(svc, animated: true, completion: nil)
		}
	}
	
	func showSignIn() {
		tabbarController?.selectedIndex = 0
	}
	func showNews() {
		tabbarController?.selectedIndex = 1
	}
	func showUserProfile() {
		tabbarController?.selectedIndex = 2
	}
	func showFeedback() {
		tabbarController?.selectedIndex = 3
	}
	
}
