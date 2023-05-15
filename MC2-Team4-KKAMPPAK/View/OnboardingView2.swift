//
//  OnboardingView2.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/15.
//

import SwiftUI

struct OnboardingView2: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    @Binding var showView: Bool
    @Binding var isSecondView: Bool
    @State var selectedTime: String? = nil
    @State var hours: Int
    @State var minutes: Int
    @State var seconds: Int
    
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("최대 사용 시간을\n설정해볼까요?")
                    .font(.system(size: 28,weight: .heavy))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.bottom, 15)
                Text("스마트폰을 연속으로 이만큼 사용하면\n깜빡이가 알려드릴게요!")
                    .font(.system(size: 18,weight: .heavy))
                    .foregroundColor(Color("thirdCircle"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 51)
                    .lineSpacing(7)
                TimePicker(hours: $hours,  minutes: $minutes, seconds: $seconds)
                    .frame(maxHeight: 150)
                    .padding(.horizontal, 5)
                    .foregroundColor(.white)
                    .colorScheme(.dark)
                Spacer()
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                    showView = false
                    isSecondView = false
                    selectedTime =
                    "+ \(hours)시간 \(minutes)분 \(seconds)초"
                    print( selectedTime ?? "")
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
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                    showView = false
                    isSecondView = false
                    
                } label: {
                    Text("나중에 설정하기")
                        .foregroundColor(Color("secondCircle"))
                        .underline(true,color: Color("secondCircle"))
                        .baselineOffset(5)
                        .padding(.top, 25)
                }
            }
           
        }
      
        
    }
    
}

//struct OnboardingView2_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView2()
//    }
//}
