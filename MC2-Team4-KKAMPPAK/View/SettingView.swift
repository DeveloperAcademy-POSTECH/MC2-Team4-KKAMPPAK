import SwiftUI

struct SettingView: View {
    
    @State private var isToggleOn = false
    @State private var selectedTime: String? = nil
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("backgroundColor")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        Image("nocard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 121)
                        
                        Image("Didyou")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 153)
                            .padding(.bottom, 80)
                        Spacer()
                    }
                    .padding(.leading, 35)
                    Spacer()
                    VStack(alignment: .leading){
                        Text("알림")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                        HStack(alignment: .top) {
                            VStack(alignment: .leading){
                                Text("연속 사용 시간 알림")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("연속으로 이만큼 사용하면 깜빡이가 알려드려요!")
                                    .foregroundColor(Color("centerCircle"))
                                    .bold()
                                    .font(.system(size: 11))
                            }
                            .frame(alignment: .leading)
                            //                        .frame(maxWidth: .infinity)
                            .padding(.leading, 0)
                            Spacer()
                            Toggle(isOn: $isToggleOn) {
                                EmptyView()
                            }
                            .frame(width: 70)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                        }
                        .padding(.trailing, 35)
                        .padding(.vertical, 20)
                        Group {
                            if isToggleOn {
                                VStack(alignment: .leading) {
                                    if (selectedTime != nil){
                                        Text(selectedTime ?? "")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                            .opacity(hours == 0 && minutes == 0 && seconds == 0 ? 0 : 1)
                                            .padding(.horizontal, 15)
                                            .padding(.vertical, 8)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.white, lineWidth: 1)
                                            )
                                    }
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            selectedTime =
                                            "+ \(hours)시간 \(minutes)분 \(seconds)초"
                                            handleStartDeviceActivityMonitoring(interval:  (hours * 3600) + (minutes * 60) + seconds)
                                        }, label: {
                                            Text("확인")
                                                .foregroundColor(.blue)
                                        })
                                    }
                                    TimePicker(hours: $hours, minutes: $minutes, seconds: $seconds)
                                        .frame(maxHeight: 150)
                                        .padding(.horizontal, 5)
                                        .foregroundColor(.white)
                                    
                                }
                                
                                .colorScheme(.dark)
                            }
                        }
                        .padding(.trailing, 35)
                        Divider()
                            .background(Color.white)
                            .padding(.trailing, 10)
                        NavigationLink(destination: MakesMembers())
                        {
                            HStack {
                                Text("깜빡을 만든 사람들")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 5)
                            }
                            .padding(.vertical, 20)
                            .padding(.trailing, 35)
                            
                        }
                        Divider()
                            .background(Color.white)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                    .padding(.leading, 35)
                    .padding(.vertical, 23)
                    .frame(height: 570)
                    .background(Color.gray.opacity(0.2))
                }
                .animation(Animation.easeInOut)
            }
            .onAppear(){
                print("\(hours) : \(minutes) : \(seconds)")
                if(hours !=  0 || minutes !=  0 || seconds != 0){
                    isToggleOn = true
                }
            }
        }.navigationBarTitle("설정")
        .foregroundColor(.blue)
        .accentColor(.white)
        .navigationBarBackButtonHidden(false)
       
       
    }
}

extension SettingView {

    //앱 제한 모니터링 등록 및 시작
    private func handleStartDeviceActivityMonitoring(includeUsageThreshold: Bool = true, interval: Int) {
        ScreenTime.shared.handleStartDeviceActivityMonitoring(includeUsageThreshold: includeUsageThreshold, interval:  (hours * 3600) + (minutes * 60) + seconds)
    }

    private func handleSetBlockApplication() {
        ScreenTime.shared.handleSetBlockApplication()
    }

}
//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
