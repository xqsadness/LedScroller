//
//  SelectionColor.swift
//  LedScroller
//
//  Created by darktech4 on 15/05/2024.
//

import SwiftUI

struct SelectionColor: View {
    var title: String
    var item:[DataModel]
    var keyPathToProperty: KeyPath<DataModel, Color>
    @Binding var selected: Color
    
    var body: some View {
        VStack(alignment: .leading,spacing: 24){
            
            Text(title).bold()
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    ColorPicker("", selection: $selected)
                    
                    ForEach(item){ item in
                        Text(item.item)
                            .frame(width: 40, height: 40)
                            .font(.custom(item.font, size: 18))
                            .foregroundStyle(.white)
                            .background(item.color, in: Circle())
                            .scaleEffect(selected == item[keyPath: keyPathToProperty] ? 0.7 : 1)
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(selected == item[keyPath: keyPathToProperty] ? .white : .clear)
                            }
                            .onTapGesture {
                                withAnimation {
                                    selected = item[keyPath: keyPathToProperty]
                                }
                            }
                            .frame(height: 45)
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
        }
    }
}
