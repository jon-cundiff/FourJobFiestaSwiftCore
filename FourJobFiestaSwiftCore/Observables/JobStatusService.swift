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
    @Published var jobSetTag: JobTag? = nil
    @Published var runType: RunType = .regular
    @Published var isDuplicatesAllowed: Bool = false
    
    private var jobs = Jobs.buildJobs()
    private var selectedJobs: [Job] = []
    
    init(jobStatuses: [JobStatus]?) {
        self.jobStatuses = jobStatuses ?? getInitialStatuses()
    }
    
    func handleTouch(touchId: UUID) {
        guard let jobStatusIndex = self.jobStatuses.firstIndex(where: {js in
            js.id == touchId
        }) else {
            print("id not found")
            return
        }
        
        var newJobStatuses = self.jobStatuses
        var processTags = getProcessTags(crystal: newJobStatuses[jobStatusIndex].crystal)
        
        if (newJobStatuses[jobStatusIndex].job == nil) {
            newJobStatuses[jobStatusIndex].job = rollJob(tags: processTags)
        }
        
        self.jobStatuses = newJobStatuses
    }
    
    private func getProcessTags(crystal: Crystal) -> [JobTag] {
        let crystalBasedJobs = getTagsFromCrystal(crystal: crystal)
        return switch (jobSetTag) {
            case .classic: [.classic]
            case .team750: [.team750] + crystalBasedJobs
            case .teamNo750: [.teamNo750] + crystalBasedJobs
            case .onion: getOnionTags(crytal: crystal)
            default: crystalBasedJobs
        }
    }
    
    private func getOnionTags(crytal: Crystal) -> [JobTag] {
        return switch (crytal) {
            case .wind: [.onion1]
            case .water: [.onion2]
            case .fire: [.onion3]
            case .earth: [.onion4]
        }
    }
    
    private func getTagsFromCrystal(crystal: Crystal) -> [JobTag] {
        return switch (crystal) {
            case .wind: getWindCrystalJobTags()
            case .water: getWaterCrystalJobTags()
            case .fire: getFireCrystalJobTags()
            case .earth: getEarthCrystalJobTags()
        }
    }
    
    private func getWindCrystalJobTags() -> [JobTag] {
        return switch (runType) {
            case .regular, .typhoon: [.wind]
            case .volcano, .meteor: [.wind, .water, .fire, .earth]
        }
    }
    
    private func getWaterCrystalJobTags() -> [JobTag] {
        return switch (runType) {
            case .regular: [.water]
            case .typhoon: [.wind, .water]
            case .volcano: [.water, .fire, .earth]
            case .meteor: [.wind, .water, .fire, .earth]
        }
    }
    
    private func getFireCrystalJobTags() -> [JobTag] {
        return switch (runType) {
            case .regular: [.fire]
            case .typhoon: [.wind, .water, .fire]
            case .volcano: [.fire, .earth]
            case .meteor: [.wind, .water, .fire, .earth]
        }
    }
    
    private func getEarthCrystalJobTags() -> [JobTag] {
        return switch (runType) {
            case .regular, .volcano: [.earth]
            case .typhoon, .meteor: [.wind, .water, .fire, .earth]
        }
    }
    
    private func rollJob(tags: [JobTag]) -> Job {
        let filteredJobs = Jobs.getJobsOfTypes(jobs: jobs, tags: tags, selectedJobs: isDuplicatesAllowed ? [] : selectedJobs, meteorSelected: false)
        guard let randomJob = filteredJobs.randomElement() else {
            return Job(name: "Freelancer")
        }
        
        return randomJob
    }
}
