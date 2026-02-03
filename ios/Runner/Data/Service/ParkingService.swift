//
//  ParkingService.swift
//  Runner
//
//  Created by Aziz Nurfalah on 02/02/26.
//

class ParkingService {
    private let groupNameKey = "group.id.my.aziznfl.parking_start_time"
    private let parkingTimeKey = "parking_start_time"
    
    func set(date: Date?) {
        let defaults = UserDefaults(suiteName: groupNameKey)
        
        if let date {
            defaults?.set(date, forKey: parkingTimeKey)
        } else {
            defaults?.removeObject(forKey: parkingTimeKey)
        }
    }
    
    func get() -> Date? {
        let defaults = UserDefaults(suiteName: groupNameKey)
        return defaults?.object(forKey: parkingTimeKey) as? Date
    }
}
