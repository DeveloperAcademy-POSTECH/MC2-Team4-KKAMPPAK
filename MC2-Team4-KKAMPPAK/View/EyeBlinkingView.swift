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
    @State var progressValue: Float = 0.0
    @State private var tag:Int? = nil
    @Environment(\.presentationMode) var presentation
    
    let hapticManager = HapticManager.instance
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                BlinkARViewContainer(checkBlink: $checkBlink)
                Color("backgroundColor").edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Text("눈 깜빡이기. \n1분간 15회")
                        .font(.largeTitle)
                        .bold()
                        .lineSpacing(5)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.top, 15)
                        .padding(.leading, 50)
                        .padding(.bottom, 75)
                      
                    ZStack{
                        Circle()
                            .stroke(Color.white,style: .init(lineWidth: 6))
                            .frame(width: 300,height: 300)
                            .frame(maxWidth: .infinity)
                            .opacity(0.8)
                            .scaleEffect(checkBlink ? 0 : 1)
                            .animation(
                                Animation.linear(duration: 0.5)
                                    .delay(0.2),
                                value: checkBlink
                            )
                        
                        Circle()
                            .stroke(Color("firstCircle"),style: .init(lineWidth: 13))
                            .frame(width: 250,height: 250)
                            .frame(maxWidth: .infinity)
                            .opacity(0.9)
                            .scaleEffect(checkBlink ? 0.2 : 1)
                            .animation(
                                Animation.linear(duration: 0.5)
                                    .delay(0.15),
                                value: checkBlink
                            )
                        Circle()
                            .stroke(Color("secondCircle"),style: .init(lineWidth: 17))
                            .frame(width: 195, height: 195)
                            .opacity(1)
                            .scaleEffect(checkBlink ? 0.2 : 1)
                            .animation(
                                Animation.linear(duration: 0.5)
                                    .delay(0.1),
                                value: checkBlink
                            )
                        Circle()
                            .stroke(Color("thirdCircle"),style: .init(lineWidth: 22))
                        
                            .frame(width: 140, height: 140)
                            .opacity(1)
                            .scaleEffect(checkBlink ? 0.2 : 1)
                            .animation(
                                Animation.linear(duration: 0.5)
                                    .delay(0.05),
                                value: checkBlink
                            )
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
                                    .onAppear{
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                            hapticManager.notification(type: .success)
                                        }
                                    }
                                


                            }
                        }
                        
                    }
                    .padding(.leading, 57)
                    .padding(.trailing,  57)
                    .padding(.bottom, 80)
                    
                    NavigationLink(destination: EyeMovingView(), tag: 1, selection: self.$tag){
                        
                    }
                    
                    
                    //0.5
                    
                    ProgressBar(value: $progressValue)
                        .frame(width: 300, height: 18)
                        .onAppear(){
                            self.startProgressBar()
                        }
                    
                    
//                    ProgressView(value: timeRemaining / 60.0)
//                        .frame(width: 300, height: 18)
//                        .scaleEffect(CGSize(width: 1.0, height: 4.5), anchor: .center)
//                        .cornerRadius(20.0)
//                        .accentColor(Color("Center"))
//                        .background(Color("secondary").cornerRadius(20.0))
//                        .offset(y: 60)
                    Spacer()
        
                    Button {
                        print("돌아가라 얍")
                        self.presentation.wrappedValue.dismiss()
                        // 이전화면으로 돌아가게 하는 기능 self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("중단하기")
                            .foregroundColor(Color("secondCircle"))
                            .underline(true,color: Color("secondCircle"))
                            .baselineOffset(5)
                    }
                    .padding(.bottom, 30)
                    .onDisappear {
                        withAnimation(.spring(dampingFraction: 0.6),{
                            animate.toggle()
                        })
                    }
                    
                  
                    
                }
            }
        }
        
    }
    func startProgressBar() {
        Timer.scheduledTimer(withTimeInterval: 0.0625, repeats: true, block: { timer in
            self.progressValue += 0.002
            
            if(progressValue >= 1){
                timer.invalidate()
                self.tag = 1
                
                print("finish")
                
            }
        })
    }
}



