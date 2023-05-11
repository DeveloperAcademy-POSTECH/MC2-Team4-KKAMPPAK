import UIKit
import UserNotifications

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let notificationManager = NotificationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Request notification authorization on app launch
        notificationManager.requestAuthorization()
        notificationManager.notificationCenter.delegate = notificationManager
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        for card in ContentView().cards { // Loop through all cards in the array
           let wakeUpTime = card.alarm // Get the alarm time of each card
            print(wakeUpTime)
           notificationManager.scheduleNotification(at: wakeUpTime)
        }
    }
}
