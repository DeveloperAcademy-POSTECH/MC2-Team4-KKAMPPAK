//
//  OnboardingCard.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//
import SwiftUI

struct OnboardingCard: View, Hashable, Equatable {
    let id = UUID()
    let kampakkImage : String
    let description : String
    var widthPoint: CGFloat? = 100
    var heightPoint: CGFloat? = 100
    var body: some View {
        RoundedRectangle(cornerRadius: 33)
            .foregroundColor(Color("OnboardingCard"))
            .frame(width: 280,height: 300)
            .overlay {
                VStack(alignment: .center, spacing: 0) {
                    Image(kampakkImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthPoint,height: heightPoint)
                        .padding(.top,30)
                    Text(description)
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(Color("OnboardingText"))
                        .font(.system(size:21,weight: .heavy))
                        .padding(.top,7)
                        .frame(alignment: .center)
                    
                }
                
            }
        
    }
    static func ==(lhs: OnboardingCard, rhs: OnboardingCard) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

