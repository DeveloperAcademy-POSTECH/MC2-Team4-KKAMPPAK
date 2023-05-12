import SwiftUI


struct CardItem: Identifiable, Equatable {
    var alarm: Date
    var isFlipped: Bool = false
    var degrees: Double = 180.0
    var color: Color
    var id: Date {
        alarm
    }
    
}


struct DemoView: View {
    @State private var currentIndex = 0
    @State private var tappedIndex: Int? = nil
    @Binding var cards : [CardItem]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    
    var body: some View {
        CardStack(cards, currentIndex: $currentIndex) { card in
            if (card.isFlipped) {
                RoundedRectangle(cornerRadius: 40 ,style: .continuous)
                    .foregroundColor(Color("cardColor1"))
                    .frame(width: 313, height: 359)
                    .overlay(
                        VStack {
                            // 네비게이션 바
                            HStack {
                                Button(action: {
                                    cards[currentIndex].isFlipped = false
                                    withAnimation {
                                        cards[currentIndex].degrees += 180
                                    }
                                }) {
                                    Text("취소")
                                        .foregroundColor(.blue)
                                    
                                }
                                Spacer()
                                Button(action: {
                                    cards[currentIndex].alarm = card.alarm
                                    
                                    let manager = NotificationManager()
                                   manager.requestAuthorization()
                                   manager.scheduleNotification(at: card.alarm)
                                    cards[currentIndex].isFlipped = false
                                    withAnimation {
                                        cards[currentIndex].degrees -= 180
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
                            // 알람 삭제 버튼
                            Button(action: {
                                cards.remove(at: currentIndex)
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
                        }
                    )
            } else {
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .onTapGesture {
                      
                       
                        cards[currentIndex].isFlipped = true
                        withAnimation {
                            cards[currentIndex].degrees -= 180
                            
                        }
                       
                        
                    }
                    .foregroundColor(card.color)
                    .frame(width: 313, height: 359)
                    .overlay(
                        VStack{
                            Text(dateFormatter.string(from: card.alarm))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Image("kp")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                            Text("알림 편집하기 > ")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                                .padding(.top, 30)
//                            Text("currentIndex= \(currentIndex)")
                        }
                    )
            }
            
        }

            
        
       
    }
}

//struct DemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoView(cards: [CardItem(alarm: Date(), isFlipped: false, degrees: 180)])
//    }
//}
