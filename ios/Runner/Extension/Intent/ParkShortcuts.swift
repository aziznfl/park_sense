//
//  ParkShortcuts.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

import AppIntents

struct ParkShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: StartParkingIntent(),
            phrases: [
                "Start park timer in \(.applicationName)",
                "Start parking session in \(.applicationName)",
                "Start parking in \(.applicationName)"
            ],
            shortTitle: "Start Parking Timer",
            systemImageName: "parkingsign.circle.fill"
        )
    
        AppShortcut(
            intent: StopParkingIntent(),
            phrases: [
                "Stop park timer in \(.applicationName)",
                "Stop parking session in \(.applicationName)",
                "End parking in \(.applicationName)"
            ],
            shortTitle: "Stop Parking Timer",
            systemImageName: "parkingsign.circle.fill"
        )
    }
}
