//
//  JobTests.swift
//  FourJobFiestaSwiftCoreTests
//
//  Created by Jon Cundiff on 10/20/23.
//

import XCTest
@testable import FourJobFiestaSwiftCore

class JobTests: XCTestCase {
    func test_initialValue() {
        let jobModel = Job(name: "TEST", tags: [])
        
        XCTAssertEqual(jobModel.name, "TEST")
    }
    
    func test_jobTags() {
        let jobModel = Job(name: "TEST", tags: [.wind, .classic])
        
        XCTAssertTrue(jobModel.tags.contains(.wind))
        XCTAssertTrue(jobModel.tags.contains(.classic))
    }
}
