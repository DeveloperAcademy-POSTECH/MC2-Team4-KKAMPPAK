//
//  NoCard.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/08.
//

import SwiftUI

struct NoCard: View {
 
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            .foregroundColor(Color("backgroundColor")).frame(width: 313, height: 359).overlay(
            VStack{
                Image("nocard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
                Text("앗, 알람이 없어요!")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                    .font(.title3)
            }
        )
    }
}

struct NoCard_Previews: PreviewProvider {
    static var previews: some View {
        NoCard()
    }
}
