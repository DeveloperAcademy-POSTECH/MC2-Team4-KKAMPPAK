//
//  OnboardingView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//

import SwiftUI
import FamilyControls
import DeviceActivity
import ManagedSettings

struct OnboardingView: View {
    let items = [
        OnboardingCard(kampakkImage: "sleepKampak", description:"밤에 폰 하느라\n 잠을 잘 수 없어요!"),
        OnboardingCard(
            kampakkImage: "watch", description:"시간 가는 줄\n모르겠어요!"),
        OnboardingCard(kampakkImage: "cardKampak", description:"화면을 오래\n보니 눈이 뻑뻑해요!"),
    ]
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = false
    @Binding var showView: Bool
    @Binding var isSecondView: Bool
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var isAnimate = false
    @State private var currentIndex: Int = 0
    @State private var offset: CGFloat = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("backgroundColor")
                    .ignoresSafeArea()
                ScrollViewReader{ value in
                    ScrollView{
                        VStack{
                            Text("깜빡이와 함께하는")
                                .foregroundColor(Color("centerCircle"))
                                .font(.system(size : 18,weight: .heavy))
                                .bold()
                                .padding(.top, 80)
                            Text("눈, 깜빡했나요?\n스마트폰 사용 시간,\n깜빡했나요?")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 28,weight: .heavy))
                                .foregroundColor(Color.white)
                                .bold()
                                .padding(.top, 2)
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach(0..<items.count * 30) { index in
                                        let itemIndex = index % items.count
                                        OnboardingCard(kampakkImage: items[itemIndex].kampakkImage,
                                                       description: items[itemIndex].description)
                                    }
                                    .offset(x: offset)
                                    .animation(.easeInOut(duration: 0.2))
                                    .onReceive(timer) { _ in
                                        let scrollSpeed: CGFloat = 5 // 조정 가능한 스크롤 속도
                                        offset -= scrollSpeed
                                        
                                        if offset >= UIScreen.main.bounds.width {
                                            currentIndex += 1
                                            offset -= UIScreen.main.bounds.width
                                        }
                                        
                                        if currentIndex >= items.count + 1 {
                                            currentIndex = 1
                                            offset = 0
                                        }
                                    }
                                }
                                
                            }
                            .padding(.top, 80)
                            .frame(height: 245)
                                
                                Image(systemName: "chevron.compact.down")
                                    .resizable()
                                    .frame(width: 45,height: 15 )
                                    .foregroundColor(Color.gray)
                                    .offset(y: 80 + buttonOffset)
                                    .animation(.linear(duration: 0.4).repeatForever(autoreverses: true), value: buttonOffset )
                                    .onAppear {
                                        buttonOffset = 10
                                        isAnimating = true
                                    }
                                    .onTapGesture {
                                        withAnimation(.linear){
                                            print("테스트")
                                            value.scrollTo(2,anchor: .top)
                                        }
                                       
    
                                    }
                                    .padding(.top, 50)
                                  
                                
                                
                                VStack(alignment: .leading){
                                    Rectangle()
                                        .foregroundColor(Color("BG"))
                                        .padding(.bottom, 100)
                                        .id(2)
                                    OnboardingText(title: "Z세대의\n스마트폰 사용\n하루 평균 7시간.", description: "건강한 일상을 가로막는 주된 원인!", gif: "onboardgif", gifwidth: 267, gifheight: 278)
                                    OnboardingText(title: "눈깜빡 운동\n4초당 1회, 1분에 15회 이상", description: "스마트폰 사용 중에 발생하는,\n안구건조증, 각종 각막질환을 예방해요",gif: "onboadingBlink",gifwidth: 134,gifheight: 80)
                                        .padding(.top, 50)
                                    OnboardingText(title: "눈 상하좌우 운동.\n양 옆 위아래 1분", description: "누적된 눈 피로에 더욱 효과적으로!",gif: "onboadingSide",gifwidth: 134,gifheight: 80)
                                        .padding(.top,100)
                                    OnboardingText(title: "원하는 시간에,\n깜빡이의 알림을!", description: "지키고자 하는 스마트폰 사용시간을\n깜빡이가 알려줘요", gif: "NextCard 2", gifwidth: 246, gifheight: 254)
                                        .padding(.top,150)
                                }
                                .padding(.top, 128)
                        }.padding(.bottom, 50)
                        }
                        ZStack{
                            VStack{
                                Button {
                                    isSecondView = true
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 40)
                                            .frame(width: 314,height: 80)
                                            .foregroundColor(Color("centerCircle"))
                                        Text("다음")
                                            .font(.system(size:24))
                                            .bold()
                                            .foregroundColor(.white)
                                    }
                                }
                                
                            }
                      
                        }.onAppear(perform: {
                                                reqScreenTimePermission()
                                                reqNotificationPermission()
                                            })
                    }
                }
                
            }
            
        }
    }

extension OnboardingView {
    
    //MARK: 스크린타임 권한 요청
    private func reqScreenTimePermission() {
        let center = AuthorizationCenter.shared

        if center.authorizationStatus == .approved {
            print("ScreenTime Permission approved")
        } else {
            Task {
                do {
                     try await center.requestAuthorization(for: .individual)
                 } catch {
                     print("Failed to enroll Aniyah with error: \(error)")
                 }
            }
        }
    }
    
    //MARK: 유저노티피케이션 권한 요청
    private func reqNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.alertSetting {
                case .enabled:
                    print("Notification Permission approved")
                default:
                    print("not..!")
                Task {
                    do {
                        try await center.requestAuthorization(options: [.alert, .sound])
                    } catch {
                        print("Failed to enroll Aniyah with error: \(error)")
                    }
                    
                }
            }
        }

    }
}
