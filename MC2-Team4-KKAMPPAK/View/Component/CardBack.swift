//
//  CardBack.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/07.
//

import SwiftUI

struct CardBack: View {
    @Binding var selectedTime: Date
    @Binding var isFlipped: Bool
    @Binding var degrees: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color(red: 0.942, green: 0.951, blue: 1))
            .frame(width: 313, height: 359)
            .overlay(
                VStack{
                    // 네비게이션 바
                    HStack {
                        Button(action: {
                            self.isFlipped = false
                            withAnimation {
                                self.degrees += 180
                            }
                        }) {
                            Text("취소")
                            
                        }
                        Spacer()
                        Button(action: {
                           
                            self.selectedTime = selectedTime
                            setNotification()
                            self.isFlipped = false
                            withAnimation {
                                self.degrees -= 180
                            }
                        }) {
                            Text("저장")
                                .fontWeight(.bold)
                        }
                    }
                    .padding(30)
                 
                    .frame(height: 64)
//                       .background(Color.white.shadow(color: Color.gray.opacity(0.4), radius: 2, x: 0, y: 2))
                    
                    // 타임 피커
                    DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .frame(width: 313, height: 359 / 2)
                    
                    // 알람 삭제 버튼
                     Button(action: {
                            // 알람 삭제 버튼 액션
                        }) {
                            Text("알람 삭제")
                                .foregroundColor(.red)
                                .font(.headline)
                                .frame(maxWidth: .infinity, minHeight: 45)
                        }
                    .background(Color(#colorLiteral(red: 0.902, green: 0.914, blue: 0.961, alpha: 1)))
                    .cornerRadius(9)
                    .padding()
                    
                    
                    Spacer()
                }
        )
    }
    
    private func setNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                scheduleNotification()
            } else {
                print("알림 권한이 거부되었습니다.")
            }
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "깜빡하기"
        content.body = "띠링! 👀 깜빡 할 시간입니다."
        content.sound = .default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: selectedTime), repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("알림 등록에 실패했습니다. \(error.localizedDescription)")
            } else {
                print("알림이 등록되었습니다.")
            }
        }
    }
    
}

