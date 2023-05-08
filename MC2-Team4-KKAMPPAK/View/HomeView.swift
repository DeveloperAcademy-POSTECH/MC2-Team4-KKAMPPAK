import SwiftUI

struct HomeView: View {

    @State var isFlipped = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 313
    @State var height: CGFloat = 359
    @State var cardCount: Int = 0
    @State private var selectedTime = Date()
    
    var body: some View {
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
                .disabled(!isFlipped)
                .padding(.bottom, 8)
            }
            .padding(30)
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



