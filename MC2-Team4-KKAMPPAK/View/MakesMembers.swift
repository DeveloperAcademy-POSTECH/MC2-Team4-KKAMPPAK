//
//  MakseKamView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//

import SwiftUI

struct MakesMembers: View {
    let developers = [sample(name: "Hani", mimoji: "Hani", discription: "요즘 자주 깜빡해요..."), sample(name: "Dana", mimoji: "Dana", discription: "천재 디발자."), sample(name: "Woozu", mimoji: "Woozu", discription: "우주최강 디발자."), sample(name: "Whaeun", mimoji: "Whaeun", discription: "깜빡 좋아여~"), sample(name: "Walker", mimoji: "Walker", discription: "기빨리는중..."),sample(name: "Rash", mimoji: "Rash", discription: "가슴이 뛰었어요")]
    var body: some View {
        NavigationView{
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                VStack(spacing :0) {
                    ForEach(developers.indices, id:
                            \.self){ index in
                        DeveloperRaw(mimoji: developers[index].mimoji, name: developers[index].name, discription: developers[index].discription)
                            .padding(.bottom, 11)
                    }
                }
                .padding(.top,52)
            }
            
            .ignoresSafeArea()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("깜빡을 만든 사람들")
                        .foregroundColor(.white)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(red: 0.15, green: 0.15, blue: 0.15), for: .navigationBar)
        
    }
    
    struct MakesMembers_Previews: PreviewProvider {
        static var previews: some View {
            MakesMembers()
        }
    }
}
