//
//  MovingLoadingView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by doeun kim on 2023/05/15.
//

import SwiftUI

struct MovingLoadingView: View {
    @Binding var animate: Bool
    @State private var showView = false
    
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .edgesIgnoringSafeArea(.all)
            
            if showView {
                EyeMovingView(eyeMovingCnt: 0, checkModeChange: false)
            }
            
            VStack{
                RoundedRectangle(cornerRadius: 38)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 0)
                    .frame(width: 260, height: 60)
                    .overlay(
                        HStack {
                            Text("눈 움직이기")
                                .foregroundColor(Color("secondCircle"))
                                .font(.system(size: 20, weight: .heavy))
                            + Text("로 이동했어요👀")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    )
                    .offset(y: animate ? -350 : -480)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            animate.toggle()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            showView = true
                        }
                        
                    }
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

struct MovingLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        MovingLoadingView(animate: .constant(false))
    }
}
