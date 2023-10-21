//
//  Jobs.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import Foundation

class Jobs {
    static let crystalTagBase: [JobTag] = [.wind, .water, .fire, .earth]
    
    static func buildJobs() -> [Job] {
        return [
            Job(name: "Knight", tags: [.wind, .teamNo750, .classic, .onion, .onion1]),
            Job(name: "Monk", tags: [.wind, .teamNo750, .classic, .onion, .onion2]),
            Job(name: "Thief", tags: [.wind, .teamNo750, .classic, .onion, .onion1]),
            Job(name: "White Mage", tags: [.wind, .team750, .classic, .onion, .onion2]),
            Job(name: "Black Mage", tags: [.wind, .team750, .classic, .onion, .onion1]),
            Job(name: "Blue Mage", tags: [.wind, .team750]),
            
            Job(name: "Red Mage", tags: [.water, .team750, .classic, .onion, .onion2]),
            Job(name: "Time Mage", tags: [.water, .team750]),
            Job(name: "Summoner", tags: [.water, .team750, .onion, .onion3]),
            Job(name: "Beserker", tags: [.water, .teamNo750]),
            Job(name: "Mystic Knight", tags: [.water, .teamNo750]),
            
            Job(name: "Beastmaster", tags: [.fire, .teamNo750]),
            Job(name: "Geomancer", tags: [.fire, .team750, .onion, .onion3]),
            Job(name: "Ninja", tags: [.fire, .teamNo750, .onion, .onion4]),
            Job(name: "Ranger", tags: [.fire, .teamNo750]),
            Job(name: "Bard", tags: [.fire, .team750, .onion, .onion3]),
            
            Job(name: "Dragoon", tags: [.earth, .teamNo750, .onion, .onion4]),
            Job(name: "Dancer", tags: [.earth, .team750]),
            Job(name: "Samurai", tags: [.earth, .teamNo750, .onion, .onion4]),
            Job(name: "Chemist", tags: [.earth, .team750]),
            
            Job(name: "Freelancer", tags:[.all]),
            Job(name: "Mime", tags: [.all]),
            
            Job(name: "Cannoneer", tags: [.advance]),
            Job(name: "Oracle", tags: [.advance]),
            Job(name: "Gladiator", tags: [.advance])
        ]
    }
    
    static func separateCrystalTags(tags: [JobTag]) -> ([JobTag],[JobTag]) {
        var crystalTags: [JobTag] = []
        var otherTags: [JobTag] = []
        
        tags.forEach { tag in
            if (crystalTagBase.contains(tag)) {
                crystalTags.append(tag)
            } else {
                otherTags.append(tag)
            }
        }
        
        return (crystalTags, otherTags)
    }
    
    static func getJobsOfTypes(jobs: [Job], tags: [JobTag], omittedJobs: [Job], meteorSelected: Bool) -> [Job] {
        let (crystalTags, otherTags) = separateCrystalTags(tags: tags)
        return jobs.filter { job in
            let jobNotInSelectedJobs = !omittedJobs.contains { selectedJob in
                selectedJob.name == job.name
            }
            
            let hasOneOfRequiredCrystals = crystalTags.count > 0 ? crystalTags.reduce(false) { $0 || job.tags.contains($1)} : true
            
            let tagsDoMatch = otherTags.count > 0 ? otherTags.allSatisfy { tag in
                job.tags.contains(tag)
            } : true
            
            return jobNotInSelectedJobs &&
            (hasOneOfRequiredCrystals && tagsDoMatch) ||
            (meteorSelected && job.tags.contains(.all))
        }
    }
}
