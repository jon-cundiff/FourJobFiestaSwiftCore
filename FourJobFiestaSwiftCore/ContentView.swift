//
//  ContentView.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var jobStatusService = JobStatusService(jobStatuses: nil)
    
    var body: some View {
        HStack {
            ForEach(jobStatusService.jobStatuses) { jobStatus in
                JobView(
                    crystal: jobStatus.crystal,
                    job: jobStatus.job?.name,
                    character: nil
                ).onTapGesture {
                    print(jobStatus.id)
                    jobStatusService.handleTouch(touchId: jobStatus.id)
                }
                
            }
        
//            JobView(crystal: .wind, job: "Black Mage", character: "Bartz").onTapGesture {
//                print("HIIII")
//            }
        }
    }
}

#Preview {
    ContentView()
}
