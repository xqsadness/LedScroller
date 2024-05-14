//
//  HomeView.swift
//  LedScroller
//
//  Created by darktech4 on 14/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State var show = false
    @State var text = "test"
    @State var FontSelected = "ChalkboardSE-Regular"
    @State var TcolorSelected = "tc1"
    @State var BcolorSelected = "bc1"
    @State var TsizsSelected: CGFloat = 100
    
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
                    tsizesSelected: $TsizsSelected
                )
            }else{
                ContentView(text: $text, textSize: $TsizsSelected, Tcolor: $TcolorSelected, Bcolor: $BcolorSelected, font: $FontSelected)
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
