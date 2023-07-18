//
//  MapViewModel.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import Foundation
import MapKit

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    @Published var reigon = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.0014, longitude: -78.9382),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    
    func locationAvailable() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("show alert location is off for this app")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("Location permissions are restricted.")
        case .denied:
            print("Please allow location permissions for this app in Settings.")
        case .authorizedAlways:
            reigon = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        case .authorizedWhenInUse:
            print("Would you like to change location permissions to always?")
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
