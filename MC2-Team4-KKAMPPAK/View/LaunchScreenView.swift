//
//  Launchscreen.swift
//  twice
//
//  Created by woozu on 2023/05/11.
//

import SwiftUI

extension ContentView {
    
    var launchScreenView: some View {
        
        ZStack(alignment: .center) {
            
            Color("AccentColor")
                .edgesIgnoringSafeArea(.all)
            Text("KKAM-PARK")
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .padding(.top,85)
            
            
            GifView(gifName: "깜빡_splash")
                .padding(.bottom,100)
                .edgesIgnoringSafeArea(.all)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                        DDiroringMusicPlayer.shared.playSound()
                    }
                }
            
            
            
//            LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("SubPrimaryColor")]),
//                            startPoint: .top, endPoint: .bottom)
//            .edgesIgnoringSafeArea(.all)
//
//            Image("LaunchScreenImage")
//
        }
        
    }
    
}
