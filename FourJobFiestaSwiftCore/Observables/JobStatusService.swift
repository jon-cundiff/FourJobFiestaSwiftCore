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
        print(newJobStatuses[jobStatusIndex])
        if (newJobStatuses[jobStatusIndex].job == nil) {
            newJobStatuses[jobStatusIndex].job = Job(name: "Knight", tags: [.wind, .teamNo750, .classic])
        }
        
        self.jobStatuses = newJobStatuses
    }
}
