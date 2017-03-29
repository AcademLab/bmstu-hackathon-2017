//
//  AppDelegate.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/27/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		setup()
		Theme.setup()
		
		return true
	}

	func setup() {
		guard let tabVC = window?.rootViewController as? TabBarViewController else {
			return
		}
		AcadeomRouter.sharedInstance.tabbarController = tabVC
		
		try? AcademicUserProfileModel.clearData()
	}
	
}

