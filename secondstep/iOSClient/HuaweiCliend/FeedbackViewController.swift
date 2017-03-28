//
//  FeedbackViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit
import MessageUI

class FeedbackViewController: AcademViewController, MFMailComposeViewControllerDelegate {

	@IBOutlet weak var commentTextView : UITextView!
	
	var viewModel : FeedbackViewModel? = AcademicFeedbackViewModel(model : AcademicUserProfileModel())
	
    override func viewDidLoad() {
		super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	@IBAction func sendFeedback() {
		self.view.endEditing(true)
		
		guard let mailComposeViewController = configuredMailComposeViewController(),
			MFMailComposeViewController.canSendMail() else {
				showMessage("Unable to present mail window.")
				return
		}
		
		self.present(mailComposeViewController, animated: true, completion: nil)
		
	}
	
	override func setup() {
		self.title = "Feedback"
	}
	
	// MARK: - MFMailCompose
	
	func configuredMailComposeViewController() -> MFMailComposeViewController? {
		guard let viewModel = viewModel else {
			showMessage("Unable to send report.")
			return .none
		}
		
		viewModel.setup(withMessage: commentTextView.text)
		let mailVC = MFMailComposeViewController()
		mailVC.mailComposeDelegate = self
		mailVC.setToRecipients(viewModel.recipients)
		mailVC.setSubject(viewModel.subject)
		mailVC.setMessageBody(viewModel.message, isHTML: true)
		
		return mailVC
	}
	
	
	func mailComposeController(_ controller: MFMailComposeViewController,
	                           didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
		
		if (result == .sent) {
			showMessage("Successfully sent.")
		}
	}

}
