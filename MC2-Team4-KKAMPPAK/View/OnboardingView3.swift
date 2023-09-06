//
//  OnboardingView3.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/16.
//

import SwiftUI

struct OnBoarding3: View {

    @State var columns = [
            MultiPicker.Column(label: "시간", options: Array(0...23).map { MultiPicker.Column.Option(text: "\($0)", tag: $0) }),
            MultiPicker.Column(label: "분", options: Array(0...59).map { MultiPicker.Column.Option(text: "\($0)", tag: $0) }),
            MultiPicker.Column(label: "초", options: Array(0...59).map { MultiPicker.Column.Option(text: "\($0)", tag: $0) }),
        ]
        
        @State var selection1: Int = 23
        @State var selection2: Int = 59
        @State var selection3: Int = 59
    
    @State
    var isPickerPresented = false

    
    var body: some View {
        ZStack{
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .ignoresSafeArea()
            VStack{
                Spacer()
                VStack(alignment: .center) {
                    HStack(alignment: .center){
                        Text("최대 사용 시간을 설정해 볼까요?").foregroundColor(Color.white)
                    }.padding(30)
                    HStack{
                        Text("연속으로 이만큼 사용하면 깜빡이가 알려드려요!").foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                    }
//                                                MultiPicker(data: data, selection: $selection).frame(height: 300)
                    MultiPicker(columns: columns, selections: [.constant(selection1), .constant(selection2), .constant(selection3)]).frame(height: 300).previewLayout(.sizeThatFits)
                }
                
                Spacer()

                NavigationLink(destination: EyeBlinkingView(checkBlink: true))
                {
                    VStack{
                        Text("깜빡 시작하기")
                            .frame(width: 313, height: 70)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .background(Color(red: 0.321, green: 0.43, blue: 1))
                            .cornerRadius(35)
                            .familyActivityPicker(headerText: "스크린 타임을 감지하고 싶은 어플을 골라주세요", isPresented: $isPickerPresented, selection: ScreenTime.shared.$selectedApps)
                        Text("알림 안 받을래요").foregroundColor(Color.gray)
                        
                    }
                }.onAppear(perform: {
//                    //reqScreenTimePermission()
                    //reqNotificationPermission()
                })
//                    )
//                }
                .padding(.bottom, 8)
            }
            .padding(30)
        }
    }
}

extension OnBoarding3 {
    
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


