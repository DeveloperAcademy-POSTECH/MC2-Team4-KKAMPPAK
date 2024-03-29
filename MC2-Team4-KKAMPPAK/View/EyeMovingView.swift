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
    @State var eyeMovingCnt : Int
    @State var checkModeChange : Bool
    
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
                    EyeMovingARViewContainer(mode: $mode, checkModeChange: $checkModeChange, isLeftCompleted: $isLeftCompleted, isRightCompleted: $isRightCompleted, isUpCompleted: $isUpCompleted, isDownCompleted: $isDownCompleted, eyeMovingCnt: $eyeMovingCnt)
                    
                    Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
                    
                    
                    VStack{
                        
                        Spacer()
                        VStack{
                            Text("눈 움직이기 양옆 15초")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.top, 15)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                              
                            Text("2초마다 움직여봐요")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading, 30)
                                .padding(.bottom, 66)
                        }
                        .padding(.leading, 30 )
                        
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255).opacity(0.5))
                                .frame(width: 65, height:320)
                            
                            Rectangle()
                                .fill(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                                .frame(width: 80, height: 80)
                            
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255))
                                .frame(width: 320, height: 65)


                            
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
                                    .frame(width: 44, height: 39)
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
                                    .frame(width: 44, height: 39)
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
                                    .frame(width: 44, height: 39)
                            }
                        }
                        .padding(.leading, 57)
                        .padding(.trailing,  57)
                        .padding(.bottom, 35)
                        
                        HStack(alignment:.center){
                            Text("\(eyeMovingCnt)")
                                .font(.system(size: 32))
                                .foregroundColor(.white)
                                .padding(.bottom, 6)
                            Text("번 움직였어요.")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 19)
                        
                        
                        VStack(alignment: .center){
                            ProgressBar(value: $progressValue)
                                .frame(width: UIScreen.main.bounds.size.width - 60, height: 20)
                                .onAppear(){
                                    self.startProgressBar()
                                }
                        }
                        .frame(width: .infinity)
                        
                        
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
                                if timeRemaining < 15.0 {
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
//                    .padding(.leading, 30)
                }
            }
            else{
                ZStack{
                    EyeMovingARViewContainer(mode: $mode, checkModeChange: $checkModeChange, isLeftCompleted: $isLeftCompleted, isRightCompleted: $isRightCompleted, isUpCompleted: $isUpCompleted, isDownCompleted: $isDownCompleted, eyeMovingCnt: $eyeMovingCnt)
                    
                    Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255).ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        Text("눈 움직이기 위아래 15초")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.top, 15)
                            .padding(.leading, 30)
                            .padding(.bottom, 3)
                          
                        Text("2초마다 움직여봐요")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading, 30)
                            .padding(.bottom, 66)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255).opacity(0.5))
                                .frame(width: 320, height: 65)
                            
                            Rectangle()
                                .fill(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                                .frame(width: 80, height: 80)
                            
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(red: 206 / 255, green: 214 / 255, blue: 255 / 255))
                                .frame(width: 65, height: 320)


                            
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
                                    .frame(width: 44, height: 39)
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
                                    .frame(width: 44, height: 39)
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
                                    .frame(width: 44, height: 39)
                            }
                            
                            
                        }
//                        .padding(.leading, 57)
//                        .padding(.trailing,  57)
                        .padding(.bottom, 35)
                        
                        HStack(alignment:.center){
                            Text("\(eyeMovingCnt)")
                                .font(.system(size: 32))
                                .foregroundColor(.white)
                                .padding(.bottom, 6)
                            Text("번 움직였어요.")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 19)
                        
                        VStack(alignment: .center){
                            ProgressBar(value: $progressValue)
                                .frame(width: UIScreen.main.bounds.size.width - 60, height: 20)
                                .onAppear(){
                                    self.startProgressBar()
                                }
                        }
                        .frame(width: .infinity)
                        
                        
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
                                if timeRemaining < 15.0 {
                                    timeRemaining += 0.01
                                }
                                else {
                                    timer.invalidate()
                                    // 30초가 지나면 NextView로 이동
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
            self.progressValue += 0.067
            
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
