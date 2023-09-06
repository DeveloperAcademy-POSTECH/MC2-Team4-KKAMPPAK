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
        OnboardingCard(kampakkImage: "sleepKampak", description:"밤에 폰 하느라\n 잠을 잘 수 없어요!",widthPoint: 1000,heightPoint: 1000),
        OnboardingCard(
            kampakkImage: "watch", description:"시간 가는 줄\n모르겠어요!"),
        OnboardingCard(kampakkImage: "cardKampak", description:"화면을 오래\n보니 눈이 뻑뻑해요!"),
    ]

    let contents = [OnboardingContent(title: "Z세대의\n스마트폰 사용\n하루 평균 7시간", description: "건강한 일상을 가로막는 주된 원인", gif: "onboardgif", gifWidth: 345, gifHeight: 349),
        OnboardingContent(title: "눈 깜빡 운동\n3초당 1회, 1분에 15회 이상", description: "스마트폰 사용 중에 발생하는\n 안구건조증, 각종 각말질환을 예방해요", gif: "onboadingBlink", gifWidth: 172, gifHeight: 96),
                    OnboardingContent(title: "눈 상하좌우 운동\n양 옆 위아래 1분", description: "누적된 눈 피로에 더욱 효과적으로!", gif: "onboadingSide", gifWidth: 172, gifHeight: 96),
                    OnboardingContent(title: "원하는 시간에\n깜빡이의 알림을!", description: "지키고자 하는 스마트폰 스크린타임을\n 깜빡이가 알려줘요", gif: "NextCard 2", gifWidth: 220, gifHeight: 229)
    ]
    
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = false
    @Binding var showView: Bool
    @Binding var isSecondView: Bool
    @State private var scrollPostion: CGPoint = .zero
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
                        headerArea
                        contentArea
                        nextButton

                    }
                }
                .onAppear {
                    reqScreenTimePermission()
                    reqNotificationPermission()
                }
            }
        }
        
    }
    
}

// MARK: Extension View
extension OnboardingView {
    
    private var headerArea: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("깜빡이와 함께하는")
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text("눈, 깜빡했나요?\n스마트폰 사용 시간,\n깜빡했나요?")
                .font(.system(size: 24,weight: .bold))
                .padding(.top,24)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("thirdCircle"))
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<300) { index in
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
            .padding(.top,50)
        }
        .padding(.top,121)
    }
    
    private var contentArea: some View {
        VStack(alignment: .center, spacing: 50) {
            VStack(alignment: .center, spacing: 0) {
                ForEach(contents.indices,id: \.self) { index in
                    Text(contents[index].title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 24,weight: .bold))
                        .padding(.top, index == 0 ?  50 : 120)
                    Text(contents[index].description)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("thirdCircle"))
                        .font(.system(size: 16))
                        .padding(.top,21)
                    GifView(gifName: contents[index].gif)
                        .frame(width: contents[index].gifWidth,height: contents[index].gifHeight)
                        .padding(.top,50)
                    
                }
            }
            
        }
    }
    
    private var nextButton: some View {
        Button {
            isSecondView = true
        } label: {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(Color("centerCircle"))
                .overlay(alignment: .center) {
                    Text("다음")
                        .font(.system(size: 20,weight: .medium))
                        .foregroundColor(.white)
                        
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal,30)
                .frame(height: 62)
        }
        .padding(.bottom,80)
        .padding(.top,110)

    }
    
    
    
}

// MARK: Extension Function
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
