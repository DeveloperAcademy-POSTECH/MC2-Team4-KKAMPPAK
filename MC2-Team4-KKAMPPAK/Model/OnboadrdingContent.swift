//
//  OnboadrdingContent.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/08/26.
//

import Foundation

struct OnboardingContent: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var gif: String
    var gifWidth: CGFloat
    var gifHeight : CGFloat
    
}


