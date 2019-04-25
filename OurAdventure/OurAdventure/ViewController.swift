//
//  ViewController.swift
//  OurAdventure
//
//  Created by student on 25/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }

    func setupLocationManager(){
        //pegar a precisao
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //pedir permissao
        locationManager.requestWhenInUseAuthorization()
        //manter atualizado a localizacao
        locationManager.startUpdatingLocation()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

