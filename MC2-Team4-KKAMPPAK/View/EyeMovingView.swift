//
//  EyeMovingView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/04.
//

import SwiftUI

struct EyeMovingView: View {
    @State private var mode = 1
    
    @State private var isLeftCompleted = false
    @State private var isRightCompleted = false
    @State private var isUpCompleted = false
    @State private var isDownCompleted = false
    
    @State private var xOffset: CGFloat = 0
    @State private var xOffset1: CGFloat = 0
    @State private var xOffset2: CGFloat = 0
    
    @State var progressValue: Float = 0.0
    
    @State private var moving = -60
    @State private var moving2 = -60
    
    var timeTrigger = true
    var realTime = Timer()
    
    let hapticManager = HapticManager.instance
    
    var body: some View {
        ZStack{
            Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
            
            if(mode == 1){
                VStack{
                    
                    ZStack{
                        EyeMovingARViewContainer(mode: $mode, isLeftCompleted: $isLeftCompleted, isRightCompleted: $isRightCompleted, isUpCompleted: $isUpCompleted, isDownCompleted: $isDownCompleted)
                        
                        Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255).opacity(0.5))
                            .frame(width: 65, height:300)
                        
                        Rectangle()
                            .fill(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                            .frame(width: 80, height: 80)
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255))
                            .frame(width: 300, height: 65)


                        
                        if(isLeftCompleted){
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 16, height: 16)
                                .offset(x: xOffset2)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        self.xOffset2 = -120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset2 = 0
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 23, height: 23)
                                .offset(x: xOffset1)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.xOffset1 = -120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset1 = 0
                                    }
                                }
                            
                            Image("kkam")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(x: xOffset)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        self.xOffset = -120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset = 0
                                    }
                                }
                            
                            
                        }
                        
                        if(isRightCompleted){
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 16, height: 16)
                                .offset(x: xOffset2)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        self.xOffset2 = 120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset2 = 0
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 23, height: 23)
                                .offset(x: xOffset1)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.xOffset1 = 120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset1 = 0
                                    }
                                }
                            
                            Image("kkam")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(x: xOffset)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    // xOffset 값을 200으로 변경하여 애니메이션을 시작합니다.
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        self.xOffset = 120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset = 0
                                    }
                                }
                        }
                        
                        if(!isRightCompleted && !isLeftCompleted){
                            Image("kkam")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        
                        
                    }
                    ProgressBar(value: $progressValue).frame(height: 20)
                        .onAppear(){
                            self.startProgressBar()
                        }
                }
            }
            else{
                VStack{
    //                Text("눈 움직이기.\n양옆, 위아래 1분")
    //                    .foregroundColor(.white)
    //                    .font(.system(size: 36))
                    
                    ZStack{
                        EyeMovingARViewContainer(mode: $mode, isLeftCompleted: $isLeftCompleted, isRightCompleted: $isRightCompleted, isUpCompleted: $isUpCompleted, isDownCompleted: $isDownCompleted)
                        
                        Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255).opacity(0.5))
                            .frame(width: 300, height: 65)
                        
                        Rectangle()
                            .fill(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                            .frame(width: 80, height: 80)
                        
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255))
                            .frame(width: 65, height: 300)


                        
                        if(isUpCompleted){
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 16, height: 16)
                                .offset(y: xOffset2)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        self.xOffset2 = -120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset2 = 0
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 23, height: 23)
                                .offset(y: xOffset1)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.xOffset1 = -120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset1 = 0
                                    }
                                }
                            
                            Image("kkam")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(y: xOffset)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        self.xOffset = -120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset = 0
                                    }
                                }
                            
                            
                        }
                        
                        if(isDownCompleted){
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255  / 255))
                                .frame(width: 16, height: 16)
                                .offset(y: xOffset2)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        self.xOffset2 = 120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset2 = 0
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color(red: 82 / 255, green: 110 / 255, blue: 255 / 255))
                                .frame(width: 23, height: 23)
                                .offset(y: xOffset1)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.xOffset1 = 120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset1 = 0
                                    }
                                }
                            
                            Image("kkam")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(y: xOffset)
                                .animation(.easeInOut(duration: 0.5))
                                .onAppear() {
                                    // xOffset 값을 200으로 변경하여 애니메이션을 시작합니다.
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        self.xOffset = 120
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        hapticManager.notification(type: .success)
                                        self.xOffset = 0
                                    }
                                }
                        }
                        
                        if(!isUpCompleted && !isDownCompleted){
                            Image("kkam")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        
                        
                    }
                    
                    ProgressBar(value: $progressValue).frame(height: 20)
                        .onAppear(){
                            self.startProgressBar()
                        }
                }
            }
            
            
        }
        
    }
    
    func startProgressBar() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.progressValue += 0.032
            
            if(progressValue >= 1){
                timer.invalidate()
                if(mode == 1){
                    mode = 2
                    self.progressValue = 0
                    startProgressBar();
                }
                
                print("finish")
                
            }
        })
    }
}
