//
//  DeveloperRaw.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/15.
//

import SwiftUI

struct DeveloperRaw: View {
    let mimoji: String
    let name: String
    let discription: String
    var body: some View {

            HStack(alignment: .center){
                 Image(mimoji)
                    .resizable()
                    .frame(width: 73,height: 94)
                
                VStack(alignment: .leading){
                    Text(name)
                        .font(.system(size: 17))
                        .foregroundColor(Color("thirdCircle"))
                        .bold()
                    Text(discription)
                        .font(.system(size: 15))
                        .foregroundColor(Color.white)
                }
                .padding(.leading,12)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 52)
        

        
        }
}

struct DeveloperRaw_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperRaw(mimoji: "gambakk" ,name: "워커 / Walker", discription: "기빨리는중 ..")
    }
}

