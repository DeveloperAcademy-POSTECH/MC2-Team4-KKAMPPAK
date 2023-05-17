//
//  DeviceActivityMonitorExtension.swift
//  DeviceActivityMonitor
//
//  Created by yusang on 2023/05/13.
//

import DeviceActivity
import ManagedSettings
import Foundation
//import UserNotifications
import SwiftUI
import FamilyControls

// Optionally override any of the functions below.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    
    @AppStorage("selectedApps", store: UserDefaults(suiteName: "group.com.shield.kkamppak"))
    var shieldedApps = FamilyActivitySelection()

    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
            let store = ManagedSettingsStore(named: .monitoring)
            store.clearAllSettings()
    }
    
    //threshold에 도착하면 행동한다
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventDidReachThreshold(event, activity: activity)
        NotificationManager.shared.scheduleNotification()
        //NotificationManager.shared.scheduleNotification()
        let store = ManagedSettingsStore(named: .monitoring)
//        store.shield.applications = shieldedApps.applicationTokens.isEmpty ? nil : shieldedApps.applicationTokens
        store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy.specific(shieldedApps.categoryTokens)
        //store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy.all()
        
        
        // Handle the event reaching its threshold.
    }
    
    override func intervalWillStartWarning(for activity: DeviceActivityName) {
        super.intervalWillStartWarning(for: activity)
        
        // Handle the warning before the interval starts.
    }
    
    //모니터링이 끝날때 알람을 준다 - 일단은 시작할때 알림부터 제대로 해보는중
    override func intervalWillEndWarning(for activity: DeviceActivityName) {
        super.intervalWillEndWarning(for: activity)
        //NotificationManager.shared.scheduleNotification()
        
        // Handle the warning before the interval ends.
        
    }
    
    //threshold 시간이 되면 경고를 준다
    override func eventWillReachThresholdWarning(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventWillReachThresholdWarning(event, activity: activity)
        
        //NotificationManager.shared.scheduleNotification()

    }
}

//MARK: FamilyActivitySelection Parser
extension FamilyActivitySelection: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(FamilyActivitySelection.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension DeviceActivityName {
    static let once = Self("once")
}

extension ManagedSettingsStore.Name {
    static let monitoring = Self("monitoring")
}

