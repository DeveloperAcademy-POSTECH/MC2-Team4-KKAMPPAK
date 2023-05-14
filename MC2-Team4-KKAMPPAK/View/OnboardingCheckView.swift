//
//  OnboardingCheckView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//

import SwiftUI

struct OnboardingCheckView: View {
    @State private var showView = true
    var body: some View {
        if !UserDefaults.standard.bool(forKey: "isFirstLaunching") && showView{
            OnboardingView(showView: $showView)
        } else {
            ContentView()
        }
    }
}

