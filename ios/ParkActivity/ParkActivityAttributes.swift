//
//  ParkActivityAttributes.swift
//  ParkActivity
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import ActivityKit
import Foundation

struct ParkActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var date: Date
        var location: ParkLocation?
    }

    var name: String
}

struct ParkLocation: Codable, Hashable {
    let latitude: String
    let longitude: String
    let locationName: String
}
