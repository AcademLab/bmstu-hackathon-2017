//
//  Router.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class ALRouter {

	var tabbarController : UITabBarController?
	
	static let sharedInstance = ALRouter()
	
	func showAuth() {
		if !ALUserProfileModel.isAuthorized() {
			guard let svc = SignViewController.instantiate(withClass: SignViewController.className) else {
				return
			}
			
			
			let nvc = UINavigationController(rootViewController: svc)
			UIApplication.shared.topViewController?.present(nvc, animated: true, completion: nil)
		}
	}
	func showPinCode() {
			guard let pvc = PinCodeViewController.instantiate(withClass: PinCodeViewController.className) else {
				return
			}
		
		UIApplication.shared.topViewController?.navigationController?.pushViewController(pvc, animated: true)
	}
	
}
