//
//  NewsItemViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/29/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class NewsItemViewController: UIViewController {

	@IBOutlet weak var webView : UIWebView!
	
	var newsItemUrl : String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let newsItemUrl = newsItemUrl,
			let url = URL(string : newsItemUrl) else {
				dismiss(animated: true, completion: nil)
				return
		}
		
		webView.loadRequest(URLRequest(url: url))
	}

}
