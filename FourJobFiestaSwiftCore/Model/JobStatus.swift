//
//  JobStatus.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/16/23.
//

import Foundation

struct JobStatus: Identifiable {
    var id: UUID = UUID()
    var crystal: Crystal
    var job: Job?
    var charIndex: Int = 0
    var charName: String = "Bartz"
}
