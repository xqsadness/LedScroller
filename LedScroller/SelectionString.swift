//
//  SelectionString.swift
//  LedScroller
//
//  Created by darktech4 on 14/05/2024.
//

import SwiftUI

struct DataModel:Identifiable{
    var id = UUID()
    var item: String = ""
    var font: String = "ChalkboardSE-Regular"
    var sizs: CGFloat = 100
    var color: String = "bc"
}


struct SelectionString: View {
    var title: String
    var item:[DataModel]
    var keyPathToProperty: KeyPath<DataModel, String>
    @Binding var selected: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 24){
            
            Text(title).bold()
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    ForEach(item){ item in
                        Text(item.item)
                            .frame(width: 40, height: 40)
                            .font(.custom(item.font, size: 18))
                            .background(Color(item.color), in: Circle())
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

//#Preview {
//    SelectionString()
//}
