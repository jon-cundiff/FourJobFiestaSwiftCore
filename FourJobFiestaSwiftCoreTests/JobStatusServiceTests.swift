//
//  JobStatusServiceTests.swift
//  FourJobFiestaSwiftCoreTests
//
//  Created by Jon Cundiff on 10/26/23.
//

import XCTest
@testable import FourJobFiestaSwiftCore

@MainActor
final class JobStatusServiceTests: XCTestCase {
    func testRollsJobWhenNonePresent() {
        let testJobStatus = JobStatus(crystal: .wind)
        let jobStatusService = JobStatusService(jobStatuses: [testJobStatus], jobs: [Job(name: "TEST JOB", tags: [.wind])])
        
        jobStatusService.handleTouch(touchId: testJobStatus.id)
        
        XCTAssertEqual(jobStatusService.jobStatuses.first?.job?.name, "TEST JOB")
    }
    
    func testDoesNotRollJobWhenOneIsAssigned() {
        let testJobStatus = JobStatus(crystal: .wind, job: Job(name: "CURRENT JOB"))
        let jobStatusService = JobStatusService(jobStatuses: [testJobStatus], jobs: [Job(name: "TEST JOB", tags: [.wind])])
        
        jobStatusService.handleTouch(touchId: testJobStatus.id)
        
        XCTAssertEqual(jobStatusService.jobStatuses.first?.job?.name, "CURRENT JOB")
    }
    
    func testDoesNotAllowDuplicateJobIfNotToggled() {
        let testDuplicateJob = Job(name: "CURRENT JOB", tags: [.water])
        let testJobStatuses = [JobStatus(crystal: .wind, job: testDuplicateJob), JobStatus(crystal: .water)]
    
        let jobStatusService = JobStatusService(jobStatuses: testJobStatuses, jobs: [testDuplicateJob])
        
        jobStatusService.handleTouch(touchId: testJobStatuses.last!.id)
        
        XCTAssertEqual(jobStatusService.jobStatuses.last?.job?.name, "Freelancer")
    }
    
    func testDoesAllowDuplicateJobIfToggled() {
        let testDuplicateJob = Job(name: "TEST JOB", tags: [.water])
        let testJobStatuses = [JobStatus(crystal: .wind, job: testDuplicateJob), JobStatus(crystal: .water)]
    
        let jobStatusService = JobStatusService(jobStatuses: testJobStatuses, jobs: [testDuplicateJob])
        
        jobStatusService.toggleDuplicatesAllowed()
        jobStatusService.handleTouch(touchId: testJobStatuses.last!.id)
        
        XCTAssertEqual(jobStatusService.jobStatuses.last?.job?.name, "TEST JOB")
    }
}
