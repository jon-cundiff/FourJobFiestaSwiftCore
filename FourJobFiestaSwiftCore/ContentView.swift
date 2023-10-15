//
//  ContentView.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            JobView(crystal: .wind)
            JobView(crystal: .water)
            JobView(crystal: .fire)
            JobView(crystal: .earth)
        }
    }
}

#Preview {
    ContentView()
}
