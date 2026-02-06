//
//  StartParkIntent.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

import AppIntents

struct StartParkingIntent: AppIntent {
    static let title: LocalizedStringResource = "Start Parking"
    static var description = IntentDescription("Start a parking session")
    
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        await StartParkingUseCase().exec()
        return .result(dialog: "Parking session started.")
    }
}
