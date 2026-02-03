//
//  ParkActivityAttributes.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import ActivityKit
import Foundation

struct ParkActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var date: Date
        var locationName: String?
    }

    var name: String
}
