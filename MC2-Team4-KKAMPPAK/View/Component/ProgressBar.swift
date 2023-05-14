//
//  ProgressBar.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by doeun kim on 2023/05/11.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .foregroundColor(Color("secondCircle"))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color("centerCircle"))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}
