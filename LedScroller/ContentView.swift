//
//  ContentView.swift
//  LedScroller
//
//  Created by darktech4 on 14/05/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Binding var text: String
    @Binding var textSize: CGFloat
    @Binding var Tcolor: String
    @Binding var Bcolor: String
    @Binding var font: String
    @Binding var speed: Double
    
    @State var textWidth: CGFloat = 0
    @State var offset: CGFloat = 0
    var body: some View {
        ZStack{
            Color(Bcolor).ignoresSafeArea()
            GeometryReader { geo in
                Text(text)
                    .font(.custom(font, size: textSize))
                    .foregroundStyle(Color(Tcolor))
                    .fixedSize()
                    .background(GeometryReader{ textGeo -> Color in
                        DispatchQueue.main.async{
                            self.textWidth = textGeo.size.width
                        }
                        return Color.clear
                    })
                    .offset(x: offset)
                    .rotationEffect(.degrees(90))
                    .position(x: geo.size.width / 2)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
                            offset = geo.size.height + textWidth / 2
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            withAnimation(.linear(duration: speed).repeatForever(autoreverses: false)) {
                                offset = -textWidth / 2
                            }
                        }
                    }
            }
        }
        .ignoresSafeArea()
    }
}
//
//#Preview {
//    ContentView()
//}
