//
//  CardFront.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/07.
//

import SwiftUI

struct CardFront: View {
    @Binding var selectedTime: Date
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color(red: 0.942, green: 0.951, blue: 1)).frame(width: 313, height: 359).overlay(
            VStack{
                Text(dateFormatter.string(from: selectedTime))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("kp")
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

