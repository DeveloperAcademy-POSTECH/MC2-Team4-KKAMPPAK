//
//  MakseKamView.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//

import SwiftUI

struct MakesMembers: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("backgroundColor")
                Image("makes")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading)
            }
            .ignoresSafeArea()
            
        }
        
    }
    
    struct MakesMembers_Previews: PreviewProvider {
        static var previews: some View {
            MakesMembers()
        }
    }
}
