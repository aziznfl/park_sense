//
//  ParkingRepository.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

class ParkingRepositoryImpl: ParkingRepository {
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
    
    func get() -> Date? {
        parkingService.get()
    }
    
    func start() async {
        let date = Date.now
        parkingService.set(date: date)
        liveActivityManager.start(date: date)
        
        await getLocationName()
    }
    
    func stop() {
        parkingService.set(date: nil)
        
        Task {
            await liveActivityManager.stop()
        }
    }
    
    // MARK: Private Methods
    
    private func getLocationName() async {
        locationService.requestLocation()
        locationService.onGetLocationName = { location in
            guard let location else { return }
            
            Task { [weak self] in
                await self?.liveActivityManager.updateLocation(
                    location: location
                )
            }
        }
    }
}
