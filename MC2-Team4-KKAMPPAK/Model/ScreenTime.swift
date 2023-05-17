//
//  ScreenTime.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/04.
//

import SwiftUI
import Foundation
import FamilyControls
import ManagedSettings
import DeviceActivity

class ScreenTime: ObservableObject {
    
    //static let shared = ScreenTime()
    
//    @Binding var hours: Int
//    @Binding var minutes: Int
//    @Binding var seconds: Int
//
//    private init(hours: Binding<Int>, minute: Binding<Int>, seconds: Binding<Int>) {
//        self._hours = hours
//        self._hours = minute
//        self._seconds = seconds
//    }
    static let shared = ScreenTime()
    private init() {}
    
//    static var shared: ScreenTime?
//
//    static func createdShared(hours: Binding<Int>, minutes: Binding<Int>, seconds: Binding<Int>){
//            shared = ScreenTime(hours: hours, minute: minutes, seconds: seconds)
//        }
    
//    let hourComponents = Calendar.current.dateComponents([.hour], from: Date())
//    let curHour = hourComponents
//    let minuteComponents = Calendar.current.dateComponents([.minute], from: Date())
//    let curMins = minuteComponents
//    let secondsComponents = Calendar.current.dateComponents([.second], from: Date())
//    let curSec = secondsComponents
//
//    private init() {}
//    static let shared = ScreenTime()

    @AppStorage("selectedApps", store: UserDefaults(suiteName: "group.com.shield.kkamppak"))
    var selectedApps = FamilyActivitySelection()
    {
        didSet {
            handleSetBlockApplication()
        }
    }
    @AppStorage("testInt", store: UserDefaults(suiteName: "group.com.shield.kkamppak"))

    var testInt = 0
    let store = ManagedSettingsStore()
    let deviceActivityCenter = DeviceActivityCenter()
    
    func handleResetSelection() {
        selectedApps = FamilyActivitySelection()
    }
    
    func handleStartDeviceActivityMonitoring(includeUsageThreshold: Bool = true, interval: Int) {
        
        //datacomponent타입을 써야함
        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
        
        // 새 스케쥴 시간 설정
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: dateComponents.hour, minute: dateComponents.minute, second: dateComponents.second),
            intervalEnd: DateComponents(hour: 23, minute: 59, second: 59),
            repeats: false
            

            //warning Time 설정해야 알람
            //warningTime: DateComponents(minute: 1)
        )
         //새 이벤트 생성
        let event = DeviceActivityEvent(
            applications: selectedApps.applicationTokens,
            categories: selectedApps.categoryTokens,
            webDomains: selectedApps.webDomainTokens,
            //threshold - 이 시간이 되면 특정한 event가 발생 deviceactivitymonitor에 eventdidreachthreshold

            threshold: DateComponents(second: interval)
            )
        
        do {
            ScreenTime.shared.deviceActivityCenter.stopMonitoring()
            try ScreenTime.shared.deviceActivityCenter.startMonitoring(
                .once,
                during: schedule,
                events: includeUsageThreshold ? [.monitoring: event] : [:]
            )
                    
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    func handleSetBlockApplication() {
//        store.shield.applications = selectedApps.applicationTokens.isEmpty ? nil : selectedApps.applicationTokens
        store.shield.applicationCategories = selectedApps.categoryTokens.isEmpty
        ? .all()
        : ShieldSettings.ActivityCategoryPolicy.specific(selectedApps.categoryTokens)
        //store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy.all()
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

extension DeviceActivityEvent.Name {
    static let monitoring = Self("monitoring")
}
