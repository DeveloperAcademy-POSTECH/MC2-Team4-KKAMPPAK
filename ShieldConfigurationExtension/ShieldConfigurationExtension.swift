//
//  ShieldConfigurationExtension.swift
//  ShieldConfigurationExtension
//
//  Created by yusang on 2023/05/16.
//

import ManagedSettings
import ManagedSettingsUI
import UIKit
import SwiftUI

// Override the functions below to customize the shields used in various situations.
// The system provides a default appearance for any methods that your subclass doesn't override.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    
    @AppStorage("testInt", store: UserDefaults(suiteName: "group.com.shield.kkamppak"))
    var testInt = 0
    
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        // Customize the shield as needed for applications.
        return ShieldConfiguration(
            backgroundBlurStyle: UIBlurEffect.Style.systemThickMaterial,
            backgroundColor: UIColor.white,
            icon: UIImage(named: "kkamppakshield.png"),
            title: ShieldConfiguration.Label(text: "깜빡 하러 가실까요?", color: .black),
            subtitle: ShieldConfiguration.Label(text: "", color: .black),
            primaryButtonLabel: ShieldConfiguration.Label(text: "홈화면으로", color: .black),
            secondaryButtonLabel: ShieldConfiguration.Label(text: "", color: .black)
        )
    }
    
    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for applications shielded because of their category.
        return ShieldConfiguration(
            backgroundBlurStyle: UIBlurEffect.Style.systemThickMaterial,
            backgroundColor: UIColor.white,
            icon: UIImage(named: "kkamppakshield.png"),
            title: ShieldConfiguration.Label(text: "깜빡 하러 가실까요?", color: .yellow),
            subtitle: ShieldConfiguration.Label(text: "", color: .black),
            primaryButtonLabel: ShieldConfiguration.Label(text: "홈화면으로", color: .black),
            secondaryButtonLabel: ShieldConfiguration.Label(text: "", color: .black)
        )
    }
    
    override func configuration(shielding webDomain: WebDomain) -> ShieldConfiguration {
        // Customize the shield as needed for web domains.
        ShieldConfiguration()
    }
    
    override func configuration(shielding webDomain: WebDomain, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for web domains shielded because of their category.
        ShieldConfiguration()
    }
}
