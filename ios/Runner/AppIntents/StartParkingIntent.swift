//
//  StartParkingIntent.swift
//  Runner
//
//  Created by Aziz Nurfalah on 02/02/26.
//

import AppIntents

struct StartParkingIntent: AppIntent {
    static let title: LocalizedStringResource = "Start Parking"
    static var description = IntentDescription("Start a parking session")
    
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult {
        ParkingSession().set(date: Date())
        return .result()
    }
}
