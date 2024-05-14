//
//  SmallLED.swift
//  LedScroller
//
//  Created by darktech4 on 14/05/2024.
//

import SwiftUI

struct SmallLED: View {
    
    @Binding var text: String
    @Binding var textSize: CGFloat
    @Binding var Tcolor: String
    @Binding var Bcolor: String
    @Binding var font: String

    var body: some View {
        ZStack{
            GeometryReader { geo in
                Text(text).bold()
                    .font(.custom(font, size: textSize / 2))
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundStyle(Color(Tcolor))
                    .position(x: geo.size.width / 2 ,y: geo.size.height / 2 + 40)
            }
            .frame(height: 300)
        }
        .ignoresSafeArea()
        .background(Color(Bcolor))
    }
}

#Preview {
    HomeView()
}
