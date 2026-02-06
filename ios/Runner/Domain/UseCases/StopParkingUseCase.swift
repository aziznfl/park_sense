//
//  StopParkingUseCase.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

class StopParkingUseCase {
    private let repository: ParkingRepository
    
    init(repository: ParkingRepository = ParkingRepositoryImpl()) {
        self.repository = repository
    }
    
    func exec() {
        repository.stop()
    }
}
