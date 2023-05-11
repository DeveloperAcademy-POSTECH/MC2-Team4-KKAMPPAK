import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current() // UNUserNotificationCenter 인스턴스 생성
    
    override init() {
        super.init()
        notificationCenter.delegate = self // UNUserNotificationCenterDelegate 설정
    }
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
            // 알림 권한 요청. options에 alert와 sound 옵션 전달
            if granted {
                print("알림 권한이 허용되었습니다.")
            } else {
                print("알림 권한이 거부되었습니다.")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent() // 알림 콘텐츠를 위한 UNMutableNotificationContent 인스턴스 생성
        content.title = "깜빡하기" // 알림 제목 설정
        content.body = "띠링! 👀 깜빡 할 시간입니다." // 알림 내용 설정
        content.sound = .default // 알림 소리 설정
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 알림이 발생할 시간과 반복 여부 설정
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger) // 알림 요청 생성
        
        notificationCenter.add(request) // 생성한 알림 요청을 UNUserNotificationCenter에 추가
        
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner) // 앱이 foreground에 있는 동안 알림을 어떻게 보여줄 것인지를 설정
    }
}
