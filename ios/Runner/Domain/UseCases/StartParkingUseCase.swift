//
//  StartParkingUseCase.swift
//  Runner
//
//  Created by Aziz Nurfalah on 05/02/26.
//

class StartParkingUseCase {
    private let repository: ParkingRepository
    
    init(repository: ParkingRepository = ParkingRepositoryImpl()) {
        self.repository = repository
    }
    
    func exec() async {
        await repository.start()
    }
}
