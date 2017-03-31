//
//  PinCodeViewController.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 3/31/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class ALButton : UIButton {
	
}

extension ALButton {
	/// Толщина границы
	@IBInspectable var borderWidth: CGFloat {
		set { layer.borderWidth = newValue }
		get { return layer.borderWidth }
	}
	
	/// Цвет границы
	@IBInspectable var borderColor: UIColor? {
		set { layer.borderColor = newValue?.cgColor }
		get { return UIColor(cgColor: layer.borderColor! ) }
	}
	
	/// Радиус границы
	@IBInspectable var cornerRadius: CGFloat {
		set { layer.cornerRadius = newValue }
		get { return layer.cornerRadius  }
	}
}

@IBDesignable class ALEmojiButton : ALButton {
	@IBInspectable var symbol : String? {
		didSet {
			self .setTitle(symbol, for: .normal)
		}
	}
	
}

@IBDesignable class ALCleanButton : ALButton {
	@IBInspectable var icon : UIImage?
}

@IBDesignable class ALTouchIDButton : ALButton {
	@IBInspectable var icon : UIImage?
}


class PinCodeViewController: AcademViewController, PinCodeViewModelDelegate {

	@IBOutlet var emojiButtons : [ALEmojiButton]!
	@IBOutlet weak var pincodeTextField: UITextField!
	@IBOutlet weak var touchIDBUtton: UIButton!
	@IBOutlet weak var backBUtton: UIButton!
	var viewModel : PinCodeViewModel? = ALPinCodeViewModel(model: ALUserProfileModel())
	
	let 😎 = "😎"
	let 😉 = "😉"
	let 😶 = "😶"
	let 😏 = "😏"
	let 😠 = "😠"
	let 😟 = "😟"
	let 😣 = "😣"
	let 🙃 = "🙃"
	let 😮 = "😮"
	let 😐 = "😐"
	
	var emojisMap = [ String : String ]()
	
	
	override func setup() {
		emojisMap = [ 😎 : "1",
		              😉 : "2",
		              😶 : "3",
		              😏 : "4",
		              😠 : "5",
		              😟 : "6",
		              😣 : "7",
		              🙃 : "8",
		              😮 : "9",
		              😐 : "0"
		]
		
		var emojis = Array(emojisMap.keys)
		for emojiButton in emojiButtons {
			let idx = Int.random(range: 0..<UInt32(emojis.count))
			emojiButton.symbol = emojis.remove(at: idx)
		}
		
		self.title = viewModel?.title
		
		self.viewModel?.delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
		setupAppearance()
    }

	// MARK : Appearance
	
	func setupAppearance(){
		let image = #imageLiteral(resourceName: "TouchID").withRenderingMode(.alwaysTemplate)
		touchIDBUtton.setBackgroundImage(image, for: .normal)
		touchIDBUtton.tintColor = .red
		
	}
	
	// MARK : Delegate
	
	func didSuccess(withMsg msg : String) {
		showMessage(msg)
	}
	
	func didFailPincodeVerification(withErrMsg errMsg: String) {
		showMessage(errMsg)
	}
	
    // MARK: Actions

	@IBAction func didTap(_ sender: ALEmojiButton) {
		guard let symbol = sender.symbol,
				let number = emojisMap[symbol] else {
			return
		}
		
		let pincodeTextFieldText = pincodeTextField.text ?? ""
		pincodeTextField.text = pincodeTextFieldText + number
		
		viewModel?.verifyPinCode(pincodeTextField.text!)
	}
	@IBAction func didTapTouchID(_ sender: Any) {
	}
	@IBAction func didTapBack(_ sender: Any) {
		guard let pincodeTextFieldText = pincodeTextField.text else {
			return
		}
		
		pincodeTextField.text = String(pincodeTextFieldText.characters.dropLast())
	}

}
