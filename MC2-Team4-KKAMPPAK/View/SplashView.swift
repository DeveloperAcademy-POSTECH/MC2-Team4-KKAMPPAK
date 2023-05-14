//
//  SplashView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by woozu on 2023/05/14.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    var body: some View {
                VStack {

                    if self.isActive {
                        OnboardingCheckView()
                    } else {
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
                        }

                    }

                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }


        
        
        
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
