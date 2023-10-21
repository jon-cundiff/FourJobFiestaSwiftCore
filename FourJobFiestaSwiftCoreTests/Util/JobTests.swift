//
//  JobTests.swift
//  FourJobFiestaSwiftCoreTests
//
//  Created by Jon Cundiff on 10/20/23.
//

import XCTest
@testable import FourJobFiestaSwiftCore


final class JobTests: XCTestCase {
    let allJobs = Jobs.buildJobs()
    
    func testFiltersWindJobsRegular() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 6)
    }
    
    func testFiltersWindJobsTyphoon() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 6)
    }
    
    func testFiltersWindJobsVolcano() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water, .fire, .earth], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 20)
    }
    
    func testFiltersWaterJobsRegular() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.water], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 5)
    }
    
    func testFiltersWaterJobsTyphoon() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 11)
    }
    
    func testFiltersWaterJobsVolcano() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.water, .fire, .earth], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 14)
    }
    
    func testFiltersFireJobsRegular() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.fire], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 5)
    }
    
    func testFiltersFireJobsTyphoon() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water, .fire], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 16)
    }
    
    func testFiltersFireJobsVolcano() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.fire, .earth], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 9)
    }
    
    func testFiltersEarthJobsRegular() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.earth], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 4)
    }
    
    func testFiltersEarthJobsTyphoon() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water, .fire, .earth], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 20)
    }
    
    func testFiltersEarthJobsVolcano() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.earth], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 4)
    }
    
    func testFiltersJobsMeteor() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water, .fire, .earth], omittedJobs: [], meteorSelected: true)
        
        XCTAssertEqual(jobs.count, 22)
    }
    
    func testFiltersClassicJobs() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.classic], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 6)
    }
    
    func testFiltersTeam750Meteor() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water, .fire, .earth, .team750], omittedJobs: [], meteorSelected: true)
        
        XCTAssertEqual(jobs.count, 12)
    }
    
    func testFiltersTeamNo750FireTyphoon() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.wind, .water, .fire, .teamNo750], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 8)
    }
    
    func testFiltersFireJobsOnion() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.onion3], omittedJobs: [], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 3)
    }
    
    func testFiltersPreviousJob() {
        let jobs = Jobs.getJobsOfTypes(jobs: allJobs, tags: [.classic], omittedJobs: [Job(name: "Knight")], meteorSelected: false)
        
        XCTAssertEqual(jobs.count, 5)
    }
}

