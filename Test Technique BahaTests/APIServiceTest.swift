//
//  APIServiceTest.swift
//  Test Technique BahaTests
//
//  Created by Bahaeddine Boulaabi on 06/12/2022.
//

import XCTest
@testable import Test_Technique_Baha

final class APIServiceTest: XCTestCase {
    
    // MARK: -- sut: Service under test
    var sut: JetBrainService!
    
    override func setUpWithError() throws {
        sut = JetBrainService()
    }
    
    func testGetRepositories() {
        // API is asynchrouns operation so that's why we are using XCTestExpectation to be able to wait untill finishing
        let expection = XCTestExpectation(description: "Repositories Downloaded")
        var responseError: Error?
        var responseRepositories: Bool?
        
        sut.getJetBrain { repositories in
            responseRepositories = repositories
            expection.fulfill()
        }
        
        // Change the number of seconds to test the API
        wait(for: [expection], timeout: 3)
        XCTAssertNil(responseError)// Make sure that error == nil
        XCTAssertNotNil(responseRepositories) // Make sure that response != nil
        
    }
    override func tearDownWithError() throws {
        sut = nil
    }
    
}
