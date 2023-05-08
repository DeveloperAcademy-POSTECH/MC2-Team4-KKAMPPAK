//
//  CardBack.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/07.
//

import SwiftUI

struct CardBack: View {
    @Binding var selectedTime: Date
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    @Binding var isFlipped: Bool
    @Binding var degrees: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color(red: 0.942, green: 0.951, blue: 1))
            .frame(width: self.width, height: self.height)
            .overlay(
                VStack{
                    // 네비게이션 바
                    HStack {
                        Button(action: {
                            self.isFlipped = false
                            withAnimation {
                                self.degrees += 180
                                self.width = 313 // add other animated stuff here
                                self.height = 359
                            }
                        }) {
                            Text("취소")
                            
                        }
                        Spacer()
                        Button(action: {
                            self.selectedTime = selectedTime
                            self.isFlipped = false
                            withAnimation {
                                self.degrees -= 180
                                self.width = 313 // add other animated stuff here
                                self.height = 359
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
    
}

