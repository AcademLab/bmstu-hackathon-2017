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
fileprivate let _recipients = ["amin.benarieb@gmail.com", "kondrashin96@gmail.com"]

class AcademicFeedbackViewModel : FeedbackViewModel {
	
	var model : UserProfileModel
	
	var subject : String = _subject
	var recipients : [String] = _recipients
	var message : String = ""
	
	init(model : UserProfileModel) {
		self.model = model
	}
	
	func setup(withMessage message : String) {
		self.message = formetterReport(withMessage: message)
	}
	
	fileprivate func formetterReport(withMessage message  : String) -> String {
		
		let name = model.name() ?? "Undefined"
		let surname = model.surname() ?? "Undefined"
		let patronicName = model.patronicName() ?? "Undefined"
		let login = model.login() ?? "Undefined"
		let phone = model.phone() ?? "Undefined"
		let device = model.deviceInfo() ?? "Undefined"
		
		let fullName = "\(name) \(patronicName) \(surname)"
		
		return "<html>  <head>    <style>      body {        background-color: #EEEEEE;      }      #page {        margin-left: auto;        margin-right: auto;        padding-bottom: 45px;        width: 500px;        min-height: 370px;        background-color: #FFFFFF;        box-shadow: -1px 12px 26px -7px #000000;        border-radius: 10px;      }      #page_head {        width: 500px;        height: 100px;        font-family: \"Helvetica\";        font-size: 26;        text-align: center;        color: #5D5D5D; line-height: 100px;      }      #page_info {        margin-left: auto;        margin-right: auto;        width: 400px;      }      #page_info_table {        font-family: \"Helvetica\";        font-size: 20px;        color: #5D5D5D; line-height: 25px;        padding: 10px;      }      #page_info_table td {        min-width: 80px;      }      #comment {        margin-top: 35px;        margin-left: auto;        margin-right: auto;        width: 400px;        min-height: 100px;        border: 1px solid #000000;        font-family: \"Helvetica\";        font-size: 20px;        color: #5D5D5D; line-height: 25px;        padding: 10px;      }    </style>  </head>  <body>       <div id=\"page\">      <div id=\"page_head\">        HUAWEI support <b><i>new ticket</i></b>      </div> <!-- page_head -->      <div id=\"page_info\">        <table id=\"page_info_table\">          <tr>            <td><div>name</div></td>            <td><div id=\"name\">\(fullName)</div></td>          </tr>          <tr>            <td><div>login</div></td>            <td><b><div id=\"login\">\(login)</div></b></td>          </tr>          <tr>            <td><div>phone</div></td>            <td><div id=\"phone\">\(phone)</div></td>          </tr>          <tr>            <td><div>device</div></td>            <td><div id=\"device\">\(device)</div></td>          </tr>        </table>      </div> <!-- page_info -->      <div id=\"comment\">\(message)      </div>    </div>      </body></html>"
	}
	
}
