//
//  PopulationPresenter.swift
//  MVP-API-Demo
//
//  Created by Lana Fernando S on 24/04/22.
//

import Foundation

protocol PopulationProtocol {
    func getPopulation(completionHandler: @escaping ([PopulationModel]?) -> Void)
}

class PopulationPresenter: PopulationProtocol {
    
    func getPopulation(completionHandler: @escaping ([PopulationModel]?) -> Void) {
        APIManager.instance.createRequest(endPoints: .population) { (result: Result<[PopulationModel], Error>) in
            switch result {
            case .success(let populations):
                completionHandler(populations)
            case .failure(_):
                completionHandler(nil)
            }
        }
    }
}
