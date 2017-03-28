//
//  NewsModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/28/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireRSSParser

fileprivate let kRSSUrl = "http://www.huawei.com/ru/rss-feeds/huawei-updates/rss"

protocol NewsModel {
	func loadNews(completion : @escaping ([NewsItem]?, NewsModelError?) -> (Void) )
}

enum NewsModelError : Error {
	case unknown
	case unreachableNetwok
}

struct NewsItem {
	var title : String?
	var link : String?
	var itemDescription : String?
	var pubDate : Date?
}

class AcademicNewsModel : NewsModel{
	
	func loadNews(completion : @escaping ([NewsItem]?, NewsModelError?) -> (Void) ) {
		Alamofire.request(kRSSUrl).responseRSS() { (response) -> Void in
			
			guard let feed: RSSFeed = response.result.value else {
				completion(nil, .unreachableNetwok)
				return
			}
			
			let newsItems = feed.items.map {
				NewsItem(title: $0.title, link: $0.link, itemDescription: $0.itemDescription, pubDate: Date() )
			}
			completion(newsItems, nil)
		}
	}
	
}
