//
//  SettingView2.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/08/21.
//

import SwiftUI

struct SettingView2: View {
    @State private var isToggleOn = false
    @State private var selectedTime: String? = nil
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color("backgroundColor")
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    firstReactangle
                    NavigationLink {
                        MakesMembers()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(UIColor(red: 0.21, green: 0.21, blue: 0.23, alpha: 1)))
                            .frame(height: 59)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                HStack {
                                    Text("깜빡을 만든 사람들")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal,16)
                            }
                    }
                    .padding(.top, isToggleOn ? 22:11)
                    
                }
                .padding(EdgeInsets(top: 33, leading: 16, bottom: 0, trailing: 16))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("시스템 설정")
                        .foregroundColor(.white)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.black, for: .navigationBar)
//        .navigationTitle("시스템 설정")
//                .toolbarBackground(.visible, for: .navigationBar)
//                .toolbarBackground(.red, for: .navigationBar)
                
    }
    
}

//MARK: Views
extension SettingView2 {
    private var firstReactangle: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(UIColor(red: 0.21, green: 0.21, blue: 0.23, alpha: 1)))
                .overlay {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("알림")
                                .foregroundColor(.white)
                            Text("연속 사용시간 알림")
                                .foregroundColor(.white)
                        }
                        Toggle("", isOn: $isToggleOn)
                            .onChange(of: self.isToggleOn) { newValue in
                                if !isToggleOn{
                                    removeNotification()
                                }
                            }
                    }
                    .padding(.horizontal,16)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 59)
            if isToggleOn {
                VStack(alignment: .leading) {
                    HStack {
                        if (selectedTime != nil){
                            Text(selectedTime ?? "")
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .opacity(hours == 0 && minutes == 0 && seconds == 0 ? 0 : 1)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(Color("test").opacity(0.24))
                                )
                        }
                        Spacer()
                        Button(action: {
                            selectedTime =
                            "+ \(hours)시간 \(minutes)분 \(seconds)초"
                            handleStartDeviceActivityMonitoring(interval:  (hours * 3600) + (minutes * 60) + seconds)
                        }, label: {
                            Text("저장")
                                .foregroundColor(Color(UIColor(red: 0.32, green: 0.43, blue: 1, alpha: 1)))
                        })
                    }
                    .padding(.horizontal,16)
                   
                    TimePicker(hours: $hours, minutes: $minutes, seconds: $seconds)
                        .frame(maxHeight: 150)
                        .foregroundColor(.white)
                    
                }
                .padding(.top,12)
                .colorScheme(.dark)
            }
        }
        
    }
}


//MARK: functions
extension SettingView2 {
    
    //앱 제한 모니터링 등록 및 시작
    private func handleStartDeviceActivityMonitoring(includeUsageThreshold: Bool = true, interval: Int) {
        ScreenTime.shared.handleStartDeviceActivityMonitoring(includeUsageThreshold: includeUsageThreshold, interval:  (hours * 3600) + (minutes * 60) + seconds)
    }
    func stopDeviceMonitoring(){
        ScreenTime.shared.deviceActivityCenter.stopMonitoring()
    }
    func removeNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    private func handleSetBlockApplication() {
        ScreenTime.shared.handleSetBlockApplication()
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView2(hours: .constant(1), minutes: .constant(2), seconds: .constant(3))
    }
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}
