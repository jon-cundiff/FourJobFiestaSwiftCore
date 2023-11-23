//
//  ContentView.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var jobStatusService = JobStatusService()
    
    var body: some View {
        HStack {
            ForEach(jobStatusService.jobStatuses) { jobStatus in
                JobView(
                    crystal: jobStatus.crystal,
                    job: jobStatus.job?.name,
                    character: jobStatus.charName
                ).onTapGesture {
                    jobStatusService.handleTouch(touchId: jobStatus.id)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
