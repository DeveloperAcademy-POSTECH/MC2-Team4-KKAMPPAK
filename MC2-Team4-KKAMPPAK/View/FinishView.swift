//
//  FinishView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by DANA on 2023/05/14.
//
import SwiftUI

struct FinishView: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack{

                VStack(alignment: .center){
                    Text("깜빡 완료!")
                        .font(.system(size: 32))
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    
                }
                .padding(EdgeInsets(top: 250, leading: 130, bottom: 0, trailing: 130))
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .center){
                    Image("nocard")
                        .resizable()
                        .frame(width: 121,height: 108)
                    
                }
                .padding(EdgeInsets(top: 15, leading: 138, bottom: 0, trailing: 134))
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 40)
                           
                            NavigationLink(destination: ContentView()){
                                Text("메인 화면으로")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                            
                            
                        
                    }
                    .foregroundColor(Color("centerCircle"))
                    .frame(height: 70)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 185, leading: 39, bottom: 0, trailing: 40))
                    
                    NavigationLink(destination: EyeBlinkingView(checkBlink: false)){
                        Text("다시 깜빡 하러 가기")
                            .foregroundColor(Color("secondCircle"))
                            .underline(true,color: Color("secondCircle"))
                            .baselineOffset(5)
                    }
                    .padding(.top, 30)
                }
            }
            
        }
      
        
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
