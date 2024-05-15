//
//  HomeView.swift
//  LedScroller
//
//  Created by darktech4 on 14/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State var show = false
    @State var text = "Hello world"
    @State var FontSelected = "ChalkboardSE-Regular"
    @State var TcolorSelected: Color = .tc1
    @State var BcolorSelected: Color = .bc1
    @State var TsizsSelected: CGFloat = 100
    @State var speed: Double = 10
    
    var body: some View {
        ZStack{
            Color.sbg.ignoresSafeArea()
            if !show{
                SettingView(
                    show: $show,
                    text: $text,
                    fontselected: $FontSelected,
                    tColorSelected: $TcolorSelected,
                    bColorSelected: $BcolorSelected,
                    tsizesSelected: $TsizsSelected,
                    speed: $speed
                )
            }else{
                ContentView(
                    text: $text,
                    textSize: $TsizsSelected,
                    Tcolor: $TcolorSelected,
                    Bcolor: $BcolorSelected,
                    font: $FontSelected,
                    speed: $speed
                )
                .overlay (alignment: .topTrailing) {
                    Button(action: {
                        withAnimation {
                            show.toggle()
                        }
                    }, label: {
                        Image (systemName: "chevron.backward").bold()
                            .frame(width: 50, height: 50)
                            .background(
                                .white, in: RoundedRectangle(cornerRadius: 10).stroke (lineWidth: 2))
                            .foregroundStyle (.white)
                    })
                    .rotationEffect (.degrees (90))
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
