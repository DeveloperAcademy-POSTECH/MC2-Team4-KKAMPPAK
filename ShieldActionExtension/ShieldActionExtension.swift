//
//  ShieldActionExtension.swift
//  ShieldActionExtension
//
//  Created by yusang on 2023/05/16.
//

import ManagedSettings
import DeviceActivity
import Foundation
import SwiftUI
// Override the functions below to customize the shield actions used in various situations.
// The system provides a default response for any functions that your subclass doesn't override.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class ShieldActionExtension: ShieldActionDelegate {
    
    @AppStorage("testInt", store: UserDefaults(suiteName: "group.com.shield.kkamppak"))
    var testInt = 0
    
    let store = ManagedSettingsStore(named: .monitoring)
    
    override func handle(action: ShieldAction, for application: ApplicationToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        // Handle the action as needed.
        switch action {
        case .primaryButtonPressed:
            completionHandler(.close)
        case .secondaryButtonPressed:
            completionHandler(.defer)
        @unknown default:
            fatalError()
        }
    }
    
    override func handle(action: ShieldAction, for webDomain: WebDomainToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        // Handle the action as needed.
        completionHandler(.close)
    }
    
    override func handle(action: ShieldAction, for category: ActivityCategoryToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        // Handle the action as needed.
        switch action {
        case .primaryButtonPressed:
            completionHandler(.close)
        case .secondaryButtonPressed:
            
            if testInt >= 9
            {
                store.shield.applications = .none
                store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy<Application>.none
                testInt = 0
            } else {
                testInt += 1
            }
            completionHandler(.defer)
        
        @unknown default:
            fatalError()
        }
    }
    
}

extension DeviceActivityName {
    static let once = Self("once")
}

extension ManagedSettingsStore.Name {
    static let monitoring = Self("monitoring")
}
