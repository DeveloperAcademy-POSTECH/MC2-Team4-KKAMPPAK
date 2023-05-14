//
//  EyeMovingView.swift
//  MC2-Team4-kpPPAK
//
//  Created by yusang on 2023/05/04.
//

import SwiftUI
import ARKit
import RealityKit

struct EyeMovingView: View {
    @State private var mode = 1
    @State private var tag:Int? = nil
    @State private var isNextViewPresented = false
    @State private var timeRemaining = 0.0
    @State private var animate = false
    
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
    @Environment(\.presentationMode) var presentation
    
    var timeTrigger = true
    
    let hapticManager = HapticManager.instance
    
    var body: some View {
        
        NavigationStack{
            NavigationLink(destination: FinishView(), tag: 1, selection: self.$tag){
                
            }
            if(mode == 1){
                ZStack{
                    EyeMovingARViewContainer(mode: $mode, isLeftCompleted: $isLeftCompleted, isRightCompleted: $isRightCompleted, isUpCompleted: $isUpCompleted, isDownCompleted: $isDownCompleted)
                    
                    Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
                    
                    
                    VStack{
                        
                        Spacer()
                        Text("눈 움직이기. \n양옆, 위아래 30초")
                            .font(.largeTitle)
                            .bold()
                            .lineSpacing(5)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.top, 15)
                            .padding(.leading, 50)
                            .padding(.bottom, 75)
                        
                        ZStack{
                            
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
                                
                                Image("kp")
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
                                
                                Image("kp")
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
                                Image("kp")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        .padding(.leading, 57)
                        .padding(.trailing,  57)
                        .padding(.bottom, 80)
                        
                        
                        ProgressBar(value: $progressValue)
                            .frame(width: 300, height: 18)
                            .onAppear(){
                                self.startProgressBar()
                            }
                        
                        Spacer()
            
                        Button {
                            NavigationUtil.popToRootView()
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
            else{
                ZStack{
                    EyeMovingARViewContainer(mode: $mode, isLeftCompleted: $isLeftCompleted, isRightCompleted: $isRightCompleted, isUpCompleted: $isUpCompleted, isDownCompleted: $isDownCompleted)
                    
                    Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        Text("눈 움직이기. \n양옆, 위아래 30초")
                            .font(.largeTitle)
                            .bold()
                            .lineSpacing(5)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.top, 15)
                            .padding(.leading, 50)
                            .padding(.bottom, 75)
                        
                        ZStack{
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
                                
                                Image("kp")
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
                                
                                Image("kp")
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
                                Image("kp")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            
                            
                        }
                        .padding(.leading, 57)
                        .padding(.trailing,  57)
                        .padding(.bottom, 80)
                        
                        ProgressBar(value: $progressValue)
                            .frame(width: 300, height: 18)
                            .onAppear(){
                                self.startProgressBar()
                            }
                        
                        Spacer()
            
                        Button {
//                            self.presentation.wrappedValue.dismiss()
                            NavigationUtil.popToRootView()
                            
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
    }
        
    
    func startProgressBar() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.progressValue += 0.032
            
            if(progressValue >= 1){
                timer.invalidate()
                if mode == 1 {
                    mode = 2
                    self.progressValue = 0
                    startProgressBar();
                }
                else if mode == 2 {
                    self.tag = 1
                }
                
                print("finish")
                
            }
        })
    }
}
