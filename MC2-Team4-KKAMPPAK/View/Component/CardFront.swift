//
//  CardFront.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/07.
//

import SwiftUI

struct CardFront: View {
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    var body: some View {
        Rectangle().foregroundColor(Color(red: 0.942, green: 0.951, blue: 1)).frame(width: self.width, height: self.height).overlay(
            VStack{
                Text("01:30 AM")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("깜빡이")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                Text("알림 편집하기 > ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                    .padding(.top, 30)
            }
        ).scaleEffect(x: -1, y: 1)
            
    }
}

