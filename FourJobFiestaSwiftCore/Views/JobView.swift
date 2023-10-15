//
//  JobView.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import SwiftUI

struct JobView: View {
    let crystal: Crystals
    var body: some View {
        ZStack {
            Image(getImage())
        }
        
    }
    
    func getImage() -> ImageResource {
        return switch crystal {
        case .wind:
                .Crystals.wind
        case .water:
                .Crystals.water
        case .fire:
                .Crystals.fire
        case .earth:
                .Crystals.earth
        }
    }
}

#Preview {
    JobView(crystal: .wind)
}
