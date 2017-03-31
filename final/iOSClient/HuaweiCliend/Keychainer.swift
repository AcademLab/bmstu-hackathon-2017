//
//  Keychainer.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol Keychainer {
	
	static var sharedInstance : Keychainer { get }
	
	var login : String { get set }
	var password : String { get set }
	var token : String { get set }
}

class ALKeychainer : Keychainer {
	
	internal static var sharedInstance: Keychainer = ALKeychainer()
	
	var login : String = "" {
		didSet {
			login = login.encoded()
		}
	}
	var password : String = "" {
		didSet {
			password = password.encoded()
		}
	}
	var token : String = "" {
		didSet {
			token = token.encoded()
		}
	}
	
}
