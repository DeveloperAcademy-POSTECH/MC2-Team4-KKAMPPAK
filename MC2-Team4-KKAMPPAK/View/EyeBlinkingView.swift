//
//  EyeBlinkingView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/04.
//

import SwiftUI
import ARKit
import RealityKit
struct EyeBlinkingView: View {
    @State var checkBlink : Bool
    @State private var animate = false
    @State private var isNextViewPresented = false
    @State private var timeRemaining = 0.0
    var body: some View {
        ZStack{
            BlinkARViewContainer(checkBlink: $checkBlink)
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("눈 깜빡이기. \n1분간 15회")
                    .font(.system(size: 30))
                    .lineSpacing(5)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading, 50)
                    .padding(.bottom, 80)
                  
                ZStack{
                    Circle()
                        .stroke(Color.white,style: .init(lineWidth: 6))
                        .frame(width: 300,height: 300)
                        .frame(maxWidth: .infinity)
                        .scaleEffect(checkBlink ? 0 : 1)
                        .animation(.linear(duration: 0.5))
                    
                    Circle()
                        .stroke(Color("firstCircle"),style: .init(lineWidth: 13))
                        .frame(width: 250,height: 250)
                        .frame(maxWidth: .infinity)
                        .scaleEffect(checkBlink ? 0 : 1)
                        .animation(.linear(duration: 0.5))
                
                        
                    Circle()
                        .stroke(Color("secondCircle"),style: .init(lineWidth: 17))
                        .frame(width: 195, height: 195)
                        .scaleEffect(checkBlink ? 0 : 1)
                        .animation(.linear(duration: 0.5))
                       
                    Circle()
                        .stroke(Color("thirdCircle"),style: .init(lineWidth: 22))
                        .frame(width: 140, height: 140)
                        .scaleEffect(checkBlink ? 0 : 1)
                        .animation(.linear(duration: 0.5))
                    ZStack{
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color("centerCircle"))
                        
                        Image("normalEye")
                            .resizable()
                            .frame(width: 50,height: 30)
                        if checkBlink{
                            GifView(gifName: "eyes")
                                .frame(width: 50,height: 50)
                                .opacity(1)


                        }
                    }
                    
                }
                .padding(.leading, 57)
                .padding(.trailing,  57)
                .padding(.bottom, 80)
                ProgressView(value: timeRemaining / 60.0)
                    .frame(width: 300, height: 18)
                    .scaleEffect(CGSize(width: 1.0, height: 4.5), anchor: .center)
                    .cornerRadius(20.0)
                    .accentColor(Color("Center"))
                    .background(Color("secondary").cornerRadius(20.0))
                    .offset(y: 60)
                Spacer()
    
                Button {
                    print("돌아가라 얍")
                    // 이전화면으로 돌아가게 하는 기능 self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("중단하기")
                        .foregroundColor(Color("secondCircle"))
                        .underline(true,color: Color("secondCircle"))
                        .baselineOffset(5)
                }
                .padding(.bottom, 30)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                        if timeRemaining < 30.0 {
                            timeRemaining += 0.01
                        }
                        else {
                            timer.invalidate()
                            // 60초가 지나면 NextView로 이동
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isNextViewPresented = true
                            }
                        }
                    }
                }
                .onDisappear {
                    withAnimation(.spring(dampingFraction: 0.6),{
                        animate.toggle()
                    })
                }
                
              
                
            }
        }
        
    }
}


