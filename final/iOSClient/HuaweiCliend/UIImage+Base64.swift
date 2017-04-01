//
//  UIImage+Base64.swift
//  Emojuirity
//
//  Created by Amin Benarieb on 4/1/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

extension UIImage {
	
	public func base64() -> String? {
		let imageData = UIImageJPEGRepresentation(self, 0.5)
		return imageData?.base64EncodedString()
	}
}

extension String {
	func base64() -> UIImage? {
		let dataDecoded = Data(base64Encoded: self, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
		return UIImage(data: dataDecoded)
	}
}
