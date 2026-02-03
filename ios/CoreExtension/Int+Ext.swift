//
//  Int+Ext.swift
//  Runner
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import Foundation

extension Int {
    func toDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(self) / 1000)
    }
}
