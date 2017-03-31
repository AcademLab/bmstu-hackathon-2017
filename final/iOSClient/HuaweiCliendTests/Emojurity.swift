//
//  Emojurity.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 4/1/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import XCTest
@testable import Emojuirity
class Emojurity: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testEncoding() {
		let password = "academic"
		debugPrint( password.encoded() )
		
	}
	
}
