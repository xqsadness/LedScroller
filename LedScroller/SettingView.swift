//
//  SettingView.swift
//  LedScroller
//
//  Created by darktech4 on 14/05/2024.
//

import SwiftUI

struct SettingView: View {
    @Binding var show: Bool
    @Binding var text: String
    @Binding var fontselected: String
    @Binding var tColorSelected: String
    @Binding var bColorSelected: String
    @Binding var tsizesSelected: CGFloat
    @Binding var speed: Double
    
    var fonts: [DataModel] = [
        DataModel(item: "Aa", font: "ChalkboardSE-Regular"),
        DataModel(item: "Ab", font: "Palatino-Roman"),
        DataModel(item: "Ac", font: "Futura-Medium"),
        DataModel(item: "Ad", font: "Copperplate"),
        DataModel(item: "Ae", font: "Optima-Regular"),
        DataModel(item: "Ae", font: "Papyrus")
    ]
    var Tcolor: [DataModel] = [
        DataModel(color: "tc1"),
        DataModel(color: "tc2"),
        DataModel(color: "tc3"),
        DataModel(color: "tc4"),
        DataModel(color: "tc5"),
        DataModel(color: "tc6")
    ]
    var Bcolor: [DataModel] = [
        DataModel(color: "bc1"),
        DataModel(color: "bc2"),
        DataModel(color: "bc3"),
        DataModel(color: "bc4"),
        DataModel(color: "bc5"),
        DataModel(color: "bc6")
    ]
    var Tsize: [DataModel] = [
        DataModel(item: "100", sizs: 100),
        DataModel(item: "150", sizs: 150),
        DataModel(item: "200", sizs: 200),
        DataModel(item: "250", sizs: 250)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            SmallLED(text: $text, textSize: $tsizesSelected, Tcolor: $tColorSelected, Bcolor: $bColorSelected, font: $fontselected)
            
            ScrollView{
                textfView
                
                SelectionString(title: "Font", item: fonts, keyPathToProperty: \.font, selected: $fontselected)
                SelectionString(title: "Text color", item: Tcolor, keyPathToProperty: \.color, selected: $tColorSelected)
                SelectionString(title: "Backgound color", item: Bcolor, keyPathToProperty: \.color, selected: $bColorSelected)
                SelectionCGFloat(title: "Text size", item: Tsize, keyPathToProperty: \.sizs, selected: $tsizesSelected)
                
                sliderSpeed
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
        }
    }
    var textfView: some View{
        TextField("Your Massage", text: $text)
            .padding (.leading)
            .padding(.trailing,70)
            .frame(height: 60)
            .background(.black, in:.rect (cornerRadius: 10))
            .foregroundStyle (.white)
            .padding(.horizontal, 20)
            .overlay (alignment: .trailing) {
                Button(action: {
                    withAnimation {
                        show.toggle()
                    }
                }, label: {
                    Text("PLAY").bold()
                        .frame(width: 60, height: 55)
                        .background(.white, in: .rect (cornerRadius: 10))
                        .foregroundStyle (.black)
                        .padding(.trailing, 20)
                })
            }
    }
    
    var sliderSpeed: some View{
        VStack(alignment: .leading){
            Text("Speed \(String(format: "%.2f", speed))").bold()
                .foregroundStyle(.white)
            
            Slider(value: $speed, in: 0...10)
        }
        .padding(.bottom)
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
