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
        scheduleNotifications()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        scheduleNotifications()
    }
    
    private func scheduleNotifications() {
        for card in getCards() {
            let wakeUpTime = card.alarm
            notificationManager.scheduleNotification(at: wakeUpTime)
        }
    }
    
    private func getCards() -> [CardItem] {
        // Get the cards from ContentView or wherever they are stored
        return ContentView().cards
    }
}
