//
//  Theme.swift
//  
//
//  Created by Amin Benarieb on 3/29/17.
//
//

import ChameleonFramework

class Theme {
	static func setup() {
		UITabBar.appearance().tintColor = UIColor.white
		UIView.appearanceWhenContained(within: [UITabBar.self]).tintColor = UIColor.flatGray
		
		UITabBar.appearance().backgroundColor = UIColor.flatRed
		
		UITabBarItem.appearance().setTitleTextAttributes([  NSForegroundColorAttributeName : UIColor.flatWhite], for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes([  NSForegroundColorAttributeName : UIColor.white], for: .selected)

		
		UINavigationBar.appearance().backgroundColor = UIColor.flatRed
		UINavigationBar.appearance().tintColor = UIColor.flatRed
		
		UIButton.appearance().tintColor = UIColor.flatRed
	}
}
