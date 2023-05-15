//
//  OnboardingCheckView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//

import SwiftUI

struct OnboardingCheckView: View {
    @State private var showView = true
    @State private var isSecondeView = false
    @State private var selectedTime: String? = nil
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    var body: some View {
        if !UserDefaults.standard.bool(forKey: "isFirstLaunching") && showView && !isSecondeView {
            OnboardingView(showView: $showView, isSecondView: $isSecondeView)
            
            
        } else if !UserDefaults.standard.bool(forKey: "isFirstLaunching") && showView && isSecondeView {
            OnboardingView2(showView: $showView, isSecondView: $isSecondeView, hours: hours, minutes: minutes, seconds: seconds)
          
        } else {
            ContentView(hours: $hours, minutes: $minutes, seconds: $seconds)
          
        }
    }
}

