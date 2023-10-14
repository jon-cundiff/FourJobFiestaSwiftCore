//
//  Jobs.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import Foundation

class Jobs {
    static func buildJobs() -> [Job] {
        return [
            Job(name: "Knight", tags: [.wind, .teamNo750, .classic]),
            Job(name: "Monk", tags: [.wind, .teamNo750, .classic]),
            Job(name: "Thief", tags: [.wind, .teamNo750, .classic]),
            Job(name: "White Mage", tags: [.wind, .team750, .classic]),
            Job(name: "Black Mage", tags: [.wind, .team750, .classic]),
            Job(name: "Blue Mage", tags: [.wind, .team750]),
            
            Job(name: "Red Mage", tags: [.water, .team750, .classic]),
            Job(name: "Time Mage", tags: [.water, .team750]),
            Job(name: "Summoner", tags: [.water, .team750]),
            Job(name: "Beserker", tags: [.water, .teamNo750]),
            Job(name: "Mystic Knight", tags: [.water, .teamNo750]),
            
            Job(name: "Beastmaster", tags: [.fire, .teamNo750]),
            Job(name: "Geomancer", tags: [.fire, .team750]),
            Job(name: "Ninja", tags: [.fire, .teamNo750]),
            Job(name: "Ranger", tags: [.fire, .teamNo750]),
            Job(name: "Bard", tags: [.fire, .team750]),
            
            Job(name: "Dragoon", tags: [.earth, .teamNo750]),
            Job(name: "Dancer", tags: [.earth, .team750]),
            Job(name: "Samurai", tags: [.earth, .teamNo750]),
            Job(name: "Chemist", tags: [.earth, .team750]),
            
            Job(name: "Freelancer"),
            Job(name: "Mime"),
            
            Job(name: "Cannoneer", tags: [.advance]),
            Job(name: "Oracle", tags: [.advance]),
            Job(name: "Gladiator", tags: [.advance])
        ]
    }
    
    static func getJobsOfType(jobs: [Job], type: JobType) -> [Job] {
        return jobs.filter { job in
            return job.tags.contains(type)
        }
    }
}
