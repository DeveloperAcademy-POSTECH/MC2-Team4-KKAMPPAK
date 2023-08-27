import SwiftUI


struct ContentView: View {
    
    let colors : [Color] = [
        Color("cardColor1"), Color("cardColor2"),Color("cardColor3")]
    
    @State var cards: [CardItem] = []
    @State var isLoading: Bool = true
    @State private var animate = false
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 0.2, green: 0.2, blue: 0.2)
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack{
                    HStack{
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .topTrailing)
                            .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                            .padding(.trailing, 20)
                            .fontWeight(.heavy)
                            .onTapGesture {
                                if cards.count < 3 {
                                   for i in 0..<cards.count {
                                       let index = colors.indices.contains(i+1) ? i+1 : 0
                                       cards[i].color = colors[index]
                                   }
                                   cards.insert(CardItem(alarm: Date(), isFlipped: true, degrees: 180, color: colors[0]), at: 0)
                               }
                            }
                        NavigationLink(destination: SettingView(hours: $hours, minutes: $minutes, seconds: $seconds)){
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .topTrailing)
                                .foregroundColor(Color(red: 0.321, green: 0.43, blue: 1))
                        }
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
                    .padding(.bottom,40)
                  
                    ZStack {
                        if (cards.count == 0) {
                            NoCard()
                                .onTapGesture {
                                    if cards.count < 3 {
                                       for i in 0..<cards.count {
                                           let index = colors.indices.contains(i+1) ? i+1 : 0
                                           cards[i].color = colors[index]
                                       }
                                       cards.insert(CardItem(alarm: Date(), isFlipped: true, degrees: 180, color: colors[0]), at: 0)
                                   }
                                }
                        } else {
                            DemoView(cards: $cards)
                        }
                     
                    }
                   
                    Spacer()
                    
                    NavigationLink (destination: BlinkingLoadingView(animate: $animate))
                    {
                        Text("깜빡하러가기")
                            .frame(width: 313, height: 70)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .background(Color(red: 0.321, green: 0.43, blue: 1))
                            .cornerRadius(35)
                            .onDisappear {
                                           withAnimation(.spring(dampingFraction: 0.6),{
                                               animate.toggle()
                                           })
                                       }
                            
                    }
    //                .disabled(!isFlipped)
                    .padding(.bottom, 15)
                }
                .padding(30)
//                if isLoading {
//                    launchScreenView
//                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear(){
//                let notificationManager = NotificationManager.shared
//                notificationManager.scheduleNotification1(hours: hours, minutes: minutes, seconds: seconds)
                print("\(hours) : \(minutes) : \(seconds)")
            }
//
        }
        

    }
}

//
struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(hours: .constant(0), minutes: .constant(0), seconds: .constant(0))
    }
}



