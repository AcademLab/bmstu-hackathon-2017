//
//  NewsViewModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol NewsViewModelDelegate : class {
	func didFailedLoadNews(errMsg : String)
	func didUpdateNews(newsItems : [NewsItem])
}

protocol NewsViewModel {
	var newsItems : [NewsItem]? { get }
	weak var delegate : NewsViewModelDelegate? { get set }
	func updateData() 
}

class AcademicNewsViewModel : NewsViewModel {
	
	var model : NewsModel
	weak var delegate : NewsViewModelDelegate?
	
	var newsItems : [NewsItem]?
	
	init(model : NewsModel) {
		self.model = model
	}
	
	func updateData() {
		model.loadNews {
			[unowned self]
			(newsItems, error) -> (Void) in
			
			guard let newsItems = newsItems, error == nil else {
				self.delegate?.didFailedLoadNews(errMsg: "Unable to load news")
				return
			}
			
			self.newsItems = newsItems
			self.delegate?.didUpdateNews(newsItems: newsItems)
		}
	}
	
}
