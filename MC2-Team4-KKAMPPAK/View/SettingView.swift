//
//  SettingView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/04.
//

import SwiftUI

struct SettingView: View {
    
    @State var columns = [
            MultiPicker.Column(label: "시간", options: Array(0...23).map { MultiPicker.Column.Option(text: "\($0)", tag: $0) }),
            MultiPicker.Column(label: "분", options: Array(0...59).map { MultiPicker.Column.Option(text: "\($0)", tag: $0) }),
            MultiPicker.Column(label: "초", options: Array(0...59).map { MultiPicker.Column.Option(text: "\($0)", tag: $0) }),
        ]
        
        @State var selection1: Int = 23
        @State var selection2: Int = 59
        @State var selection3: Int = 59
    
    @State private var toggling = false
    @State private var showingToggle = false

    
    var body: some View {
        ZStack(alignment: .top){
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .ignoresSafeArea()
            VStack{
                Text("설정").font(.system(size: 30)).foregroundColor(Color.white).frame(alignment: .center)
                HStack{
                    Image("nocard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, alignment: .leading)
                }.frame(alignment: .leading)

                NavigationView {
                    
                    Form {
                        
                        Section(footer: Text("연속으로 이 만큼 사용하면 깜빡이가 알려드려요")) {
                            Toggle(isOn: $showingToggle) {
                                Text("연속시간 알림")
                            }
                            
                            if showingToggle {
                                Button(action: {
                                    //액션 구현부
                                }) {
                                    MultiPicker(columns: columns, selections: [.constant(selection1), .constant(selection2), .constant(selection3)]).frame(height: 300).previewLayout(.sizeThatFits)
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                    }
                }
            }

                HStack{
                    
                }
                
            }
        }
    }

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
