//
//  GetParkingUseCase.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

class GetParkingUseCase {
    private let repository: ParkingRepository
    
    init(repository: ParkingRepository = ParkingRepositoryImpl()) {
        self.repository = repository
    }
    
    func exec() -> Date? {
        repository.get()
    }
}
