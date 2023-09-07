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
    @State var blinkCnt : Int
    @State private var animate = false
    @State private var timeRemaining = 0.0
    @State var progressValue: Float = 0.0
    @State private var next = false
    @State private var tag:Int? = nil
    @Environment(\.presentationMode) var presentation
    
    let hapticManager = HapticManager.instance
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                BlinkARViewContainer(checkBlink: $checkBlink, blinkCnt: $blinkCnt)
                Color("backgroundColor").edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Text("눈 깜빡이기 30초")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.top, 15)
                        .padding(.leading, 30)
                        .padding(.bottom, 5)
                      
                    Text("3초에 한번 깜빡여봐요")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.bottom, 66)
                    
                    ZStack{
                        Circle()
                            .stroke(Color.white,style: .init(lineWidth: 6))
                            .frame(width: 300,height: 300)
                            .frame(maxWidth: .infinity)
                            .opacity(0.8)
                            .scaleEffect(checkBlink ? 0 : 1)
                            .animation(
                                Animation.easeInOut(duration: 0.5)
//                                Animation.linear(duration: 0.5)
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
//                                Animation.linear(duration: 0.5)
                                Animation.easeInOut(duration: 0.5)
                                    .delay(0.15),
                                value: checkBlink
                            )
                        Circle()
                            .stroke(Color("secondCircle"),style: .init(lineWidth: 17))
                            .frame(width: 195, height: 195)
                            .opacity(1)
                            .scaleEffect(checkBlink ? 0.2 : 1)
                            .animation(
//                                Animation.linear(duration: 0.5)
                                Animation.easeInOut(duration: 0.5)
                                    .delay(0.1),
                                value: checkBlink
                            )
                        Circle()
                            .stroke(Color("thirdCircle"),style: .init(lineWidth: 22))
                        
                            .frame(width: 140, height: 140)
                            .opacity(1)
                            .scaleEffect(checkBlink ? 0.2 : 1)
                            .animation(
//                                Animation.linear(duration: 0.5)
                                Animation.easeInOut(duration: 0.5)
                                    .delay(0.05),
                                value: checkBlink
                            )
                        ZStack{
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color("centerCircle"))
                            
                            Image("eye")
                                .resizable()
                                .frame(width: 60,height: 30)
                            if checkBlink{
                                GifView(gifName: "blinking")
                                    .frame(width: 60,height: 60)
                                    .opacity(1)
                                    .onAppear{
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                            hapticManager.notification(type: .success)
                                        }
                                    }



                            }
                        }
                        
                    }
                    .padding(.leading, 35)
                    .padding(.trailing,  35)
                    .padding(.bottom, 35)
                    
                    HStack(alignment:.center){
                        Text("\(blinkCnt)")
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                            .padding(.bottom, 6)
                        Text("번 깜빡였어요.")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 19)
                    
                    ProgressBar(value: $progressValue)
                        .frame(width: UIScreen.main.bounds.size.width - 60, height: 20)
                        .onAppear(){
                            self.startProgressBar()
                        }
                    
                    
                    Spacer()
                    
                    NavigationLink (destination: MovingLoadingView(animate: $animate),
                                    isActive: $next
                    ){
                        
                    }
        
                    Button {
                        NavigationUtil.popToRootView()
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
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.progressValue += 0.033
            
            if(progressValue >= 1){
                timer.invalidate()
                next = true
                
            }
        })
    }
}



