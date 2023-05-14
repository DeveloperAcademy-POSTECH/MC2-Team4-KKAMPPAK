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
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 33)
                .foregroundColor(Color("OnboardingCard"))
                .frame(width: 213,height: 245)
            VStack(alignment: .center){
                
                
                Image(kampakkImage)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .padding(.bottom,10)
                Text(description)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundColor(Color("OnboardingText"))
                    .font(.system(size:21,weight: .heavy))
                    .padding(.bottom,15)
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

struct OnboardingCard_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCard(kampakkImage: "Group 5", description: "밤에 폰 하느라\n 잠을 잘 수 없어요!")
    }
}
