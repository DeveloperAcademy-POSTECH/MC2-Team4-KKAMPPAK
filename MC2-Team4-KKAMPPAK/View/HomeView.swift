import SwiftUI
import FamilyControls
import DeviceActivity
import ManagedSettings

struct HomeView: View {

    @State var isFlipped = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 313
    @State var height: CGFloat = 359
    @State var cardCount: Int = 0
    @State private var selectedTime = Date()
    
    @State var data: [(String, [String])] = [
        ("Hour", Array(0...24).map { "\($0)" }),
        ("Minute", Array(0...59).map { "\($0)" }),
        ("Second", Array(0...59).map { "\($0)" })
    ]
    @State var selection: [String] = [0, 0, 0].map { "\($0)" }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.2, green: 0.2, blue: 0.2)
                    .ignoresSafeArea()
                VStack{
                    
                    HStack{
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .topTrailing)
                            .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                            .padding(.trailing, 20)
                            .onTapGesture {
                                self.cardCount += 1
                            }
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .topTrailing)
                            .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                            .padding(.trailing, 20)
                    }
                    Spacer()
                    HStack{
                        Text("  👀, 깜빡했나요?")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                            .bold()
                        Spacer()
                    }
                    
                    Spacer()
                    ZStack {
                        if (cardCount == 0) {
                            NoCard()
                        } else {
                            if isFlipped {
                                CardBack(selectedTime: $selectedTime, width: self.$width,
                                         height: self.$height,
                                         isFlipped: self.$isFlipped,
                                         degrees: self.$degrees)
                            } else {
                                CardFront(selectedTime: $selectedTime, width: self.$width,
                                          height: self.$height)
                            }
                        }
                        
                    }
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        if self.isFlipped {
                            self.isFlipped = false
                            withAnimation {
                                self.degrees += 180
                                self.width = 313 // add other animated stuff here
                                self.height = 359
                            }
                        } else {
                            self.isFlipped = true
                            withAnimation {
                                self.degrees -= 180
                                self.width = 313 // add other animated stuff here
                                self.height = 359
                            }
                        }
                    }
                    .padding(.bottom, 35)
                    Spacer()
                    NavigationLink(destination: OnBoarding3())
                    {
                        Text("깜빡하러가기")
                            .frame(width: 313, height: 70)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .background(Color(red: 0.321, green: 0.43, blue: 1))
                            .cornerRadius(35)
                    }
//                    .disabled(!isFlipped)
                    .padding(.bottom, 8)
                }
                .padding(30)
            }.onAppear(perform: {
                reqScreenTimePermission()
            })
//            .onAppear(perform: {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        print("All set!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }
//                // Check current time to see if user was in restrictions mode
//            })
        }
    }
}

extension HomeView {
    
    //MARK: 스크린타임 권한 요청
    private func reqScreenTimePermission() {
        let center = AuthorizationCenter.shared

        if center.authorizationStatus == .approved {
            print("ScreenTime Permission approved")
        } else {
            Task {
                do {
                     try await center.requestAuthorization(for: .individual)
                 } catch {
                     print("Failed to enroll Aniyah with error: \(error)")
                     // 사용자가 허용안함.
                     // Error Domain=FamilyControls.FamilyControlsError Code=5 "(null)
                 }
            }
        }
    }
    
//    private func reqScreenTimePermission() {
//        let center = AuthorizationCenter.shared
//
//        if AuthorizationCenter.shared.authorizationStatus == .approved {
//            print("ScreenTime Permission approved")
//        } else {
//            Task {
//                do {
//                     try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
//                 } catch {
//                     print("Failed to enroll Aniyah with error: \(error)")
//                     // 사용자가 허용안함.
//                     // Error Domain=FamilyControls.FamilyControlsError Code=5 "(null)
//                 }
//            }
//        }
//    }
    
    //MARK: 유저노티피케이션 권한 요청
    private func reqNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.alertSetting {
                case .enabled:
                    print("Notification Permission approved")
                default:
                    print("not..!")
                Task {
                    do {
                        try await center.requestAuthorization(options: [.alert, .badge, .sound])
                    } catch {
                        print("Failed to enroll Aniyah with error: \(error)")
                    }
                    
                }
            }
        }

    }
    //MARK: 현재 선택된 앱 초기화
    private func handleResetSelection() {
        ScreenTime.shared.handleResetSelection()
        handleStartDeviceActivityMonitoring(includeUsageThreshold: false)
    }
    
    //MARK: 앱 제한 모니터링 등록 및 시작
    private func handleStartDeviceActivityMonitoring(includeUsageThreshold: Bool = true) {
        ScreenTime.shared.handleStartDeviceActivityMonitoring(includeUsageThreshold: includeUsageThreshold)
    }
    
    private func handleSetBlockApplication() {
        ScreenTime.shared.handleSetBlockApplication()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



