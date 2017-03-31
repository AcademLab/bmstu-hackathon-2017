//
//  UIViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

extension UIViewController {
	static func instantiate(withClass identifier : String) -> UIViewController? {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let vc = storyboard.instantiateViewController(withIdentifier: identifier)
		return vc
	}
}
