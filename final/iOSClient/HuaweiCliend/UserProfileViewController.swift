//
//  UserProfileViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit
import DKCamera

class UserProfileViewController: AcademViewController, ImagerViewModelDelegate {
	
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var deviceLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	let camera = DKCamera()
	
	var viewModel : ImagerViewModel? = ALImagerViewModel(model: ALImagerModel())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		ALRouter.sharedInstance.showAuth()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		viewModel?.didRequestImage()
	}
	
	override func setup() {
		self.title = "User Profile"
		viewModel?.delegate = self
		
		camera.didCancel = { () in
			self.dismiss(animated: true, completion: nil)
		}
		
		camera.didFinishCapturingImage = {(image: UIImage) in
			self.viewModel?.didSendImage(image.base64())
			self.dismiss(animated: true, completion: nil)
		}
	}
	
	// MARK: Preload image from server
	
	// MARK: Actions
	
	@IBAction func didTapOnSendPhoto(_ sender: Any) {
		

		self.present(camera, animated: true, completion: nil)
		
		
	}
	@IBAction func didTapOnGetPhoto(_ sender: Any) {
		viewModel?.didRequestImage()
	}

	// MARK: ImagerViewModelDelegate
	
	func didSuccess(withImage image: String) {
		self.imageView.image = image.base64()
	}
	
	func didFailImageSending(errorMsg: String) {
		showMessage(errorMsg)
	}
	

}

