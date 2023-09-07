//
//  FinishView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by DANA on 2023/05/14.
//
import SwiftUI

struct FinishView: View {
    @State private var animate = false
    
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
                .padding(EdgeInsets(top: 220, leading: 130, bottom: 0, trailing: 130))
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .center){
                    Image("nocard")
                        .resizable()
                        .frame(width: 121,height: 108)
                    
                }
                .padding(.top, 15)
                .padding(.bottom, 30)
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                           
                        Button {
//                            handleResetSelection()
                            NavigationUtil.popToRootView()
                        } label: {
                            Text("메인으로 돌아가기")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(Color.white)
                        }
                        
                    }
                    .foregroundColor(Color("centerCircle"))
                    .frame(height: 62)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 145, leading: 30, bottom: 30, trailing: 30))
                    
                    NavigationLink(destination: BlinkingLoadingView(animate: $animate)){
                        Text("다시 깜빡 하러 가기")
                            .foregroundColor(Color("secondCircle"))
                            .underline(true,color: Color("secondCircle"))
                            .baselineOffset(5)
                            .onDisappear {
                                           withAnimation(.spring(dampingFraction: 0.6),{
                                               animate.toggle()
                                           })
                                       }
                    }
                    .padding(.bottom, 60)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)

      
        
    }
}

//extension FinishView {
//    private func handleResetSelection() {
//        ScreenTime.shared.handleResetSelection()
//        handleStartDeviceActivityMonitoring(includeUsageThreshold: false)
//    }
//
//    private func handleStartDeviceActivityMonitoring(includeUsageThreshold: Bool = true) {
//        ScreenTime.shared.handleStartDeviceActivityMonitoring(includeUsageThreshold: includeUsageThreshold)
//    }
//
//    private func handleSetBlockApplication() {
//        ScreenTime.shared.handleSetBlockApplication()
//    }
//
//}
struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
