//
//  Date+Ext.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import Foundation

extension Date {
    func toComponent(_ component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        return calendar.component(component, from: self)
    }
    
    func diff() -> Date {
        Date(timeIntervalSinceReferenceDate: Date.now.timeIntervalSince(self))
    }
    
    func toNextHourDate() -> Date {
        let diff = Date.now.timeIntervalSince(self)
        let minutes = 60 - (Int(diff) % 3600) / 60
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self) ?? .now
    }
    
    func toNextHour() -> Int {
        let diff = Date.now.timeIntervalSince(self)
        let minutes = (Int(diff) % 3600) / 60
        
        return 60 - minutes - 1
    }
}
