//
//  StopParkIntent.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

import AppIntents

struct StopParkingIntent: AppIntent {
    static let title: LocalizedStringResource = "End Parking"
    static var description = IntentDescription("Stop a parking session")
    
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        StopParkingUseCase().exec()
        return .result(dialog: "End session")
    }
}
