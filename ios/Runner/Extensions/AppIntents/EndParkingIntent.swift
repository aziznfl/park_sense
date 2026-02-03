//
//  EndParkingIntent.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import AppIntents

struct EndParkingIntent: AppIntent {
    static let title: LocalizedStringResource = "End Parking"
    static var description = IntentDescription("End a parking session")
    
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult {
        ParkingRepository().stop()
        
        return .result()
    }
}
