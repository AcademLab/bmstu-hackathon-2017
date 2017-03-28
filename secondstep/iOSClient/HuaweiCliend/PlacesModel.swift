//
//  Shops.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/29/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let url = "http://212.116.121.122:8081/getPlaces"
fileprivate let kIdKey = "id"
fileprivate let kTypeKey = "type"
fileprivate let kNameKey = "name"
fileprivate let kLatitudeKey = "latitude"
fileprivate let kLongitudeKey = "longitude"


enum PlaceType {
	case shop
	case service
	public init(rawValue : Int) {
		switch rawValue {
		case 1:
			self = .service
		default:
			self = .shop
		}
	}
}

struct PlacePosition {
	var latitude : Double
	var longitude : Double
}

struct PlaceItem {
	var id : Int
	var name : String
	var type : PlaceType
	var position : PlacePosition
}

protocol PlacesModel {
	func loadPlaces(completion : @escaping ([PlaceItem]?, NetworkError?) -> (Void) )
}

class AcademPlacesModel : PlacesModel{
	func loadPlaces(completion : @escaping ([PlaceItem]?, NetworkError?) -> (Void) ) {
		Network.sendRequest(url: url) { (JSONData, error) -> (Void) in
			
			guard error == nil else {
				completion(.none, error)
				return
			}
			
			guard let JSONData = JSONData else {
				completion(.none, .unreachable)
				return
			}
			
			let json = JSON(JSONData)
			guard let places = json.array else {
					completion(.none, .invalidRequest)
					return
			}
			
			var placesInfo = [PlaceItem]()
			for place in places {
				guard let id = place[kIdKey].number,
					let name = place[kNameKey].string,
					let type = place[kTypeKey].number,
					let latitude = place[kLatitudeKey].number,
					let longitude = place[kLongitudeKey].number else {
						completion(.none, .invalidRequest)
						return
				}
				let position = PlacePosition(latitude: Double(latitude), longitude: Double(longitude))
				let placeType = PlaceType(rawValue : Int(type))
				placesInfo.append(PlaceItem(id: Int(id), name: name, type: placeType, position: position))
			}
			
			completion(placesInfo, nil)
			
		}
	}
}
