
//
//  PlacesViewController.swift
//  HuaweiCliend
//
//  Created by Amin Benarieb on 3/29/17.
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit
import MapKit


fileprivate let kAnnotationIdentifier = "Place"

class Place: NSObject, MKAnnotation {
	var title: String?
	var coordinate: CLLocationCoordinate2D
	var info: String
	
	init(title: String, coordinate: CLLocationCoordinate2D, placeType: PlaceType) {
		self.title = title
		self.coordinate = coordinate
		self.info = Place.name(fromType: placeType)
	}
	fileprivate static func name(fromType type : PlaceType) -> String{
		switch type {
		case .service:
			return "Service"
		default:
			return "Shop"
		}
	}
}

class PlacesViewController: AcademViewController, MKMapViewDelegate {

	@IBOutlet weak var mapView : MKMapView!
	var viewModel : PlacesViewModel? = AcademPlacesViewModel(model: AcademPlacesModel())
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupMap()
	}
	
	
	func setupMap() {
		
		mapView.delegate = self
		
		viewModel?.loadPlaces(completion: {
			[unowned self] (placesItems, errMsg) -> (Void) in
			
			guard let placesItems = placesItems,
				errMsg == nil else {
					self.showMessage(errMsg ?? "Unkown error")
					return
			}
			
			let placeAnnotations = placesItems.map {
				Place(title: $0.name,
				      coordinate: CLLocationCoordinate2DMake($0.position.latitude,
				                                             $0.position.longitude),
				      placeType: $0.type)
			}
			self.mapView.addAnnotations(placeAnnotations)
			
			self.mapView.showAnnotations(placeAnnotations, animated: true)
			
		})
	}

	
	override func setup() {
		super.setup()
		
		title = "Shops & Services"
	}
	
	//MARK : MKMapViewDelegate
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		
		if annotation is Place {
			
			var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kAnnotationIdentifier)
			
			if annotationView == nil
			{
				annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: kAnnotationIdentifier)
				annotationView!.canShowCallout = true

				let btn = UIButton(type: .detailDisclosure)
				annotationView!.rightCalloutAccessoryView = btn
			}
			else
			{
				annotationView!.annotation = annotation
			}
			
			return annotationView
		}
		
		return nil
	}
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		let capital = view.annotation as! Place
		let placeName = capital.title
		let placeInfo = capital.info
		
		let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}

}
