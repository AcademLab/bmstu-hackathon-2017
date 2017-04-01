//
//  UserProfileViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit
import CameraManager

class UserProfileViewController: AcademViewController, ImagerViewModelDelegate {
	
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var deviceLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	let cameraManager = CameraManager()
	
	var viewModel : ImagerViewModel? = ALImagerViewModel(model: ALImagerModel())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.imageView.image = #imageLiteral(resourceName: "test")
		
		ALRouter.sharedInstance.showAuth()
		cameraManager.cameraOutputQuality = .low
		cameraManager.capturePictureWithCompletion({
			[unowned self] (image, error) -> Void in
			self.imageView.image = image
		})
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func setup() {
		self.title = "User Profile"
		viewModel?.delegate = self
	}
	
	// MARK: Preload image from server
	
	// MARK: Actions
	
	@IBAction func didTapOnSendPhoto(_ sender: Any) {
		guard cameraManager.captureSession != nil else {
			cameraManager.cameraDevice = .front
			_ = cameraManager.addPreviewLayerToView(imageView)
			
			return
		}
		
		cameraManager.stopCaptureSession()
		viewModel?.didSendImage(self.imageView.image?.base64())
		
	}
	@IBAction func didTapOnGetPhoto(_ sender: Any) {
	}

	// MARK: ImagerViewModelDelegate
	
	func didSuccess(withImage image: String) {
		cameraManager.captureSession = nil
		cameraManager.stopAndRemoveCaptureSession()
		self.imageView.layer.sublayers?.removeLast()
		
		self.imageView.image = image.base64()
	}
	
	func didFailImageSending(errorMsg: String) {
		showMessage(errorMsg)
	}
	
	
	

}

