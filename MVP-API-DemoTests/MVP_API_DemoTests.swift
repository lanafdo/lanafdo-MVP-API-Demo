//
//  MVP_API_DemoTests.swift
//  MVP-API-DemoTests
//
//  Created by Lana Fernando S on 24/04/22.
//

import XCTest
@testable import MVP_API_Demo

class MVP_API_DemoTests: XCTestCase {
    
    var presenter: PopulationProtocol?
    
    override func setUpWithError() throws {
        presenter = PopulationPresenter()
    }
    
    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testPresenter() {
        let exp = expectation(description: "Get population will complete")
        if let presenter = presenter {
            presenter.getPopulation { populations in
                if let populations = populations, populations.count > 0 {
                    XCTAssertTrue(true, "Population data available")
                } else {
                    XCTAssertFalse(false, "Population data not found")
                }
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testGetPopulationAPI() {
        let exp = expectation(description: "Get population will complete")
        APIManager.instance.createRequest(endPoints: .population) { (result: Result<[PopulationModel], Error>) in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(_):
                XCTFail("API Failed")
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
}
