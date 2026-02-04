//
//  ParkingRepository.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

class ParkingRepository {
    private let parkingService: ParkingService
    private let locationService: LocationService
    private let liveActivityManager: LiveActivityManager
    
    init(parkingService: ParkingService = ParkingService(),
         locationService: LocationService = LocationService(),
         liveActivityManager: LiveActivityManager = LiveActivityManager.shared) {
        self.parkingService = parkingService
        self.locationService = locationService
        self.liveActivityManager = liveActivityManager
    }
    
    func start() {
        let date = Date.now
        parkingService.set(date: date)
        liveActivityManager.start(date: date)
        
        getLocationName()
    }
    
    func stop() {
        parkingService.set(date: nil)
        
        Task {
            await liveActivityManager.stop()
        }
    }
    
    private func getLocationName() {
        locationService.requestLocation()
        locationService.onGetLocationName = { locationName in
            guard let locationName else { return }
            
            Task { [weak self] in
                await self?.liveActivityManager.updateLocation(locationName: locationName)
            }
        }
    }
}
