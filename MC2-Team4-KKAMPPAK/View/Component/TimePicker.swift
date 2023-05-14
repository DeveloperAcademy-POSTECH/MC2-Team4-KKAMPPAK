import SwiftUI

struct TimePicker: View {
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Picker(" 시간", selection: $hours) {
                    ForEach(0..<24) { hour in
                        Text("\(hour) 시간").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width * 0.35)
                
                Picker(" 분", selection: $minutes) {
                    ForEach(0..<60) { minute in
                        Text("\(minute) 분").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width * 0.35)
                
                Picker(" 초", selection: $seconds) {
                    ForEach(0..<60) { second in
                        Text("\(second) 초").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width * 0.3)
            }
        }
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(hours: .constant(0), minutes: .constant(0), seconds: .constant(0))
    }
}
