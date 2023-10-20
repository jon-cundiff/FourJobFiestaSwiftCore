//
//  JobStatusService.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/16/23.
//

import Foundation

private func getInitialStatuses() -> [JobStatus] {
    return [
        JobStatus(crystal: .wind),
        JobStatus(crystal: .water),
        JobStatus(crystal: .fire),
        JobStatus(crystal: .earth)
    ]
}

@MainActor
class JobStatusService: ObservableObject {
    @Published var jobStatuses: [JobStatus]
    @Published var tags: [JobTag]
    private var jobs = Jobs.buildJobs()
    
    init(jobStatuses: [JobStatus]?) {
        self.jobStatuses = jobStatuses ?? getInitialStatuses()
        self.tags = []
    }
    
    func handleTouch(touchId: UUID) {
        guard let jobStatusIndex = self.jobStatuses.firstIndex(where: {js in
            js.id == touchId
        }) else {
            print("id not found")
            return
        }
        var newJobStatuses = self.jobStatuses
        var processTags = tags
        processTags.append(getTagFromCrystal(crystal: newJobStatuses[jobStatusIndex].crystal))
        
        if (newJobStatuses[jobStatusIndex].job == nil) {
            newJobStatuses[jobStatusIndex].job = rollJob(tags: processTags)
        }
        
        self.jobStatuses = newJobStatuses
    }
    
    private func getTagFromCrystal(crystal: Crystal) -> JobTag {
        return switch (crystal) {
            case .wind: .wind
            case .water: .water
            case .fire: .fire
            case .earth: .earth
        }
    }
    
    private func rollJob(tags: [JobTag]) -> Job {
        let filteredJobs = Jobs.getJobsOfTypes(jobs: jobs, tags: tags)
        guard let randomJob = filteredJobs.randomElement() else {
            return Job(name: "Freelancer")
        }
        
        return randomJob
    }
}
