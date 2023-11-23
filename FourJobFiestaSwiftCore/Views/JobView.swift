//
//  JobView.swift
//  FourJobFiestaSwiftCore
//
//  Created by Jon Cundiff on 10/14/23.
//

import SwiftUI

struct JobView: View {
    let crystal: Crystal
    let job: String?
    let character: String?
    var body: some View {
        ZStackLayout (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image(getCrystalImage())
            if let jobString = job {
                VStack () {
                    if let charString = character {
                        Image("Jobs/\(charString)-\(jobString)")
                            .offset(x:0, y:30)
                    }
                    
                    Text(jobString)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background()
                        .backgroundStyle(.red)
                }.frame(maxWidth: .infinity)
            }
        }.fixedSize()
        
        
    }
    
    func getCrystalImage() -> ImageResource {
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
    JobView(crystal: .earth, job: "Bard", character: "Bartz")
}
