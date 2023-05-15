//
//  OnboardingText.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//


import SwiftUI

struct OnboardingText: View {
    let title : String
    let description: String
    let gif: String
    let gifwidth : CGFloat
    let gifheight : CGFloat
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: 28,weight: .heavy))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 15)
                    .padding(.leading,40)
                Text(description)
                    .font(.system(size: 18,weight: .heavy))
                    .foregroundColor(Color("thirdCircle"))
                    .padding(.bottom, 51)
                    .padding(.leading,40)
                    .lineSpacing(7)
                
            }
            HStack{
                Spacer()
                GifView(gifName: gif)
                    .frame(width: gifwidth,height: gifheight,alignment: .center)
                Spacer()
            }
        }
      
     
    }
}

struct OnboardingText_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingText(title: "눈깜빡 운동\n4초당 1회, 1분에 15회 이상", description: "스마트폰 사용 중의 안구건조증\n각종 각막질환을 예방해요",gif: "onboardgif",gifwidth: 134,gifheight: 80)
    }
}
