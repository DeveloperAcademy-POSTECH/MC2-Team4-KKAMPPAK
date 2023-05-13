//
//  LoadingView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/14.
//

import SwiftUI

struct LoadingView: View {
    @Binding var animate: Bool
    let Description: String
    let Description2: String
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 38)
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 0)
                .frame(width: 260, height: 60)
                .overlay(
                    HStack {
                        Text(Description)
                            .foregroundColor(Color("center"))
                            .font(.system(size: 20, weight: .heavy))
                        + Text(Description2)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .heavy))
                    }
                )
                .offset(y: animate ? -350 : -480)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(animate: .constant(true), Description: "눈 움직이기", Description2: "로 이동했어요")
    }
}
