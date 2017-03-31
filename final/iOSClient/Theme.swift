//
//  Theme.swift
//  
//
//  Created by Amin Benarieb on 3/29/17.
//
//

import ChameleonFramework

protocol Theme  {
	func setup()
}

class ALTheme : Theme {
	func setup() {
		UITabBar.appearance().tintColor = UIColor.white
		UIView.appearanceWhenContained(within: [UITabBar.self]).tintColor = UIColor.flatGray
		
		UITabBar.appearance().backgroundColor = UIColor.flatYellow
		
		UITabBarItem.appearance().setTitleTextAttributes([  NSForegroundColorAttributeName : UIColor.flatWhite], for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes([  NSForegroundColorAttributeName : UIColor.white], for: .selected)

		
		UINavigationBar.appearance().backgroundColor = UIColor.flatYellow
		UINavigationBar.appearance().tintColor = UIColor.flatYellow
		
		UIButton.appearance().tintColor = UIColor.flatYellow
	}
}
