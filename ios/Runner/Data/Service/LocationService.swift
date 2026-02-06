//
//  LocationService.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    var onGetLocationName: ((ParkLocation?) -> Void)?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else { return }

        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                self.onGetLocationName?(nil)
                return
            }

            let coordinate = location.coordinate
            let parkLocation = ParkLocation(
                latitude: "\(coordinate.latitude)",
                longitude: "\(coordinate.longitude)",
                locationName: placemark.name ?? "Not Found"
            )
            self.onGetLocationName?(parkLocation)
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        onGetLocationName?(nil)
    }
}
