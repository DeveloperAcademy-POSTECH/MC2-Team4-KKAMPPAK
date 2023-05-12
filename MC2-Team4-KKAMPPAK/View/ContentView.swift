import SwiftUI


struct ContentView: View {
    
    let colors : [Color] = [
        Color("cardColor1"), Color("cardColor2"),Color("cardColor3")]
    
    @State var cards: [CardItem] = []
    @State var isLoading: Bool = true

    
    var body: some View {
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
                        .onTapGesture {
                            if cards.count < 3 {
                               for i in 0..<cards.count {
                                   let index = colors.indices.contains(i+1) ? i+1 : 0
                                   cards[i].color = colors[index]
                               }
                               cards.insert(CardItem(alarm: Date(), isFlipped: false, degrees: 180, color: colors[0]), at: 0)
                           }
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
                    if (cards.count == 0) {
                        NoCard()
                    } else {
                        DemoView(cards: $cards)
                    }
                 
                }
               
                Spacer()
                NavigationLink(destination: EyeBlinkingView())
                {
                    Text("깜빡하러가기")
                        .frame(width: 313, height: 70)
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .background(Color(red: 0.321, green: 0.43, blue: 1))
                        .cornerRadius(35)
                }
//                .disabled(!isFlipped)
                .padding(.bottom, 8)
            }
            .padding(30)
            if isLoading {
                launchScreenView
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                isLoading.toggle()
            })
        }
    }
}


struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



