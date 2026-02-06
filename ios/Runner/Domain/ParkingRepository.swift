//
//  ParkingRepository.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

protocol ParkingRepository {
    func get() -> Date?
    func start() async
    func stop()
}
