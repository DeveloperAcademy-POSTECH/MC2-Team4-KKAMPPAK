import SwiftUI


struct CardItem: Identifiable, Equatable {
    var alarm: Date
    var isFlipped: Bool = false
    var color: Color
    var id: Date {
        alarm
    }
    var notificationIdentifier: String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyyMMddHHmmss"
         return dateFormatter.string(from: alarm)
     }
}



struct DemoView: View {
    @State private var currentIndex = 0
    @State private var tappedIndex: Int? = nil
    @Binding var cards : [CardItem]
    @Binding var isEditing : Bool
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    var body: some View {
        CardStack(cards, currentIndex: $currentIndex) { card in
            RoundedRectangle(cornerRadius: 40 ,style: .continuous)
                .foregroundColor(card.isFlipped ? Color("cardColor1") : card.color)
                .frame(width: 313, height: 359)
                .rotation3DEffect(
                    .degrees(card.isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 0.25
                )
//                .animation(.easeInOut(duration: 0.3))
                .overlay(
                    VStack {
                        if card.isFlipped {
                            HStack {
                               Text("취소")
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isEditing.toggle()
                                         withAnimation {
                                             cards[currentIndex].isFlipped.toggle()
                                         }
                                    }
                                Spacer()
                                Button(action: {
                                    cards[currentIndex].alarm = card.alarm
                                   let manager = NotificationManager.shared
                                   manager.cancelNotification(identifier: card.notificationIdentifier)
                                   manager.scheduleNotification(at: card.alarm, identifier: card.notificationIdentifier)
                                   isEditing.toggle()
                                   withAnimation {
                                       cards[currentIndex].isFlipped.toggle()
                                   }
                                }) {
                                    Text("저장")
                                        .foregroundColor(.blue)
                                        .fontWeight(.bold)
                                }
                            }
                            .padding(30)
                            .frame(height: 64)
                            DatePicker("", selection: Binding<Date>(
                                get: { card.alarm },
                                set: { date in
                                    cards[currentIndex].alarm = date
                                }
                            ), displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .frame(width: 313, height: 180)
                            Button(action: {
                                cards.remove(at: currentIndex)
                                isEditing.toggle()
                                let manager = NotificationManager.shared
                                manager.cancelNotification(identifier: card.notificationIdentifier)
                            }) {
                                Text("알람 삭제")
                                    .foregroundColor(.red)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, minHeight: 45)
                            }
                            .background(Color(#colorLiteral(red: 0.902, green: 0.914, blue: 0.961, alpha: 1)))
                            .cornerRadius(9)
                            .padding()
                            Spacer()
                        } else {
                            Text(dateFormatter.string(from: card.alarm))
                                .font(.system(size: 38))
                                .fontWeight(.bold)
                            Image("kp")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                            HStack{
                                Text("  알림 편집하기")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                                    .onTapGesture {
                                        isEditing.toggle()
                                        withAnimation {
                                            cards[currentIndex].isFlipped.toggle()
                                        }
                                    }
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("centerCircle"))
                                    .bold()
                            }
                            .padding(.top, 30)
                        }
                    }
                )
               
              
        }
       
    }
}
//
//struct DemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoView(cards: [CardItem(alarm: Date(), isFlipped: false, degrees: 180, color: <#Color#>)])
//    }
//}
