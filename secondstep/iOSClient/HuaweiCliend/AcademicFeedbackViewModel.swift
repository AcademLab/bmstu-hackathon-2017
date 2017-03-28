//
//  AcademicFeedbackViewModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol FeedbackViewModel {
	var subject : String { get }
	var recipients : [String] { get }
	var message : String { get }
	
	func setup(withMessage message : String)
}

fileprivate let _subject = "Device problem report"
fileprivate let _recipients = ["amin.benarieb@gmail.com"]

class AcademicFeedbackViewModel : FeedbackViewModel {
	
	var model : UserProfileModel
	
	var subject : String = _subject
	var recipients : [String] = _recipients
	var message : String = ""
	
	init(model : UserProfileModel) {
		self.model = model
	}
	
	func setup(withMessage message : String) {
		
		self.message = "<b></b><br>"
						+ "<b></b><br>"
	}
	
}
