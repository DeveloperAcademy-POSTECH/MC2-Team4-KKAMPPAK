//
//  HapticManager.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by doeun kim on 2023/05/11.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
