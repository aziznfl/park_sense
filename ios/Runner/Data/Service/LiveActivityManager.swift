//
//  LiveActivityManager.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import ActivityKit

class LiveActivityManager {
    static var shared = LiveActivityManager()
    
    private var activity: Activity<ParkActivityAttributes>?
    
    func start(date: Date) {
        let attributes = ParkActivityAttributes(name: "Parking")

        let initialState = ParkActivityAttributes.ContentState(
            date: date
        )

        do {
            activity = try Activity<ParkActivityAttributes>.request(
                attributes: attributes,
                content: .init(state: initialState, staleDate: nil),
                pushType: nil
            )
        } catch {
            print("Failed to start Live Activity: \(error)")
        }
    }
    
    func updateLocation(locationName: String) async {
        let oldDate: Date = activity?.content.state.date ?? .now
        let state = ParkActivityAttributes.ContentState(
            date: oldDate,
            locationName: locationName
        )
        
        await activity?.update(
            .init(state: state, staleDate: nil)
        )
    }
    
    func stop() async {
        let state = ParkActivityAttributes.ContentState(date: .now)
        
        await activity?.end(
            .init(state: state, staleDate: nil),
            dismissalPolicy: .immediate
        )
    }
}
