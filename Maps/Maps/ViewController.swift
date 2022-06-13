//
//  ViewController.swift
//  Maps
//
//  Created by Victor Xirau on 3/12/21.
//

import UIKit
import MapKit
import Foundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var currentLocation: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UITextField!
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentLocation.layer.cornerRadius = 5
        
        mapView.layer.cornerRadius = 38.5;

        
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }

    @IBAction func searchButton(_ sender: Any) {
        
   
        self.view.isUserInteractionEnabled = false
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { (response, error) in
            if response == nil{
                print("error")
            }else{
                let punts = self.mapView.annotations
                self.mapView.removeAnnotations(punts)
                
                
                
                let latitude = response?.boundingRegion.center.latitude
                let longitud = response?.boundingRegion.center.longitude
                
                let coordenada = MKPointAnnotation()
                coordenada.title = self.searchBar.text
                coordenada.coordinate = CLLocationCoordinate2DMake(latitude!, longitud!)
                
                self.searchBar.text = ""
                
                self.mapView.addAnnotation(coordenada)
                
                self.view.isUserInteractionEnabled = true
                activityIndicator.stopAnimating()
                self.view.willRemoveSubview(activityIndicator)
                
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitud!)
                let s = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let r = MKCoordinateRegion(center: coordinate, span: s)
                self.mapView.setRegion(r, animated: true)
                
            }
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let _: CLLocationCoordinate2D = manager.location!.coordinate
    }
    
    
    @IBAction func getCurrentLocation(_ sender: Any) {
        let punts = self.mapView.annotations
        self.mapView.removeAnnotations(punts)
        
        let lat = locationManager.location?.coordinate.latitude
        let lon = locationManager.location?.coordinate.longitude
        
        let coordenada = MKPointAnnotation()
        coordenada.title = "Your Location"
        coordenada.coordinate = CLLocationCoordinate2DMake(lat!, lon!)
        
        self.mapView.addAnnotation(coordenada)
        
        
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, lon!)
        let s = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let r = MKCoordinateRegion(center: coordinate, span: s)
        self.mapView.setRegion(r, animated: true)
        
    }
    
}

