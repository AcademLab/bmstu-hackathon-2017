//
//  NewsTableViewCell.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/29/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit
import Social

protocol NewsTableViewCellDelegate : class {
	func presentSheet(fbSheet : UIViewController?)
	func presentAlert(alertVC : UIAlertController)
}

class NewsTableViewCell : UITableViewCell {
	@IBOutlet weak var titleLabel : UILabel!
	@IBOutlet weak var detailLabel : UILabel!
	var url : String?
	weak var delegate : NewsTableViewCellDelegate?
	
	@IBAction func share() {
		
		if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
			let facebookSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
			facebookSheet?.setInitialText("Share on Facebook")
			facebookSheet?.add(#imageLiteral(resourceName: "logo"))
			if let url = url {
				facebookSheet?.add(URL(string : url))
			}
			
			self.delegate?.presentSheet(fbSheet: facebookSheet)
		} else {
			let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			self.delegate?.presentAlert(alertVC: alert)
		}
		
	}
}
