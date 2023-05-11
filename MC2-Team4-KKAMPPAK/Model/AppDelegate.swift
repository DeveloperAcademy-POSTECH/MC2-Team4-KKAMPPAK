//
//  AppDelegent.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김하은 on 2023/05/11.
//


import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationManager = NotificationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        notificationManager.requestAuthorization()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
            // 타이머가 끝나면 호출되는 클로저
            self.notificationManager.scheduleNotification()
        }
        
        timer.fire()
        RunLoop.current.add(timer, forMode: .common)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // 백그라운드에 진입했을 때 호출되는 메서드
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // 포그라운드로 돌아오기 전에 호출되는 메서드
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // 앱이 활성화될 때 호출되는 메서드
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // 앱이 종료될 때 호출되는 메서드
    }
}
