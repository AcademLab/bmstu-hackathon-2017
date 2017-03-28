//
//  PlacesViewModel.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/29/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation

protocol PlacesViewModel {
	func loadPlaces(completion : @escaping ([PlaceItem]?, String?) -> (Void))
}

class AcademPlacesViewModel : PlacesViewModel {
	func loadPlaces(completion: @escaping ([PlaceItem]?, String?) -> (Void)) {
		model.loadPlaces { (placeItems, error) -> (Void) in
			guard error == nil else {
				completion(nil, "Unable to load places.")
				return
			}
			completion(placeItems, nil)
		}
	}

	var model : PlacesModel
	init(model : PlacesModel ) {
		self.model = model
	}
}
