//
//  DataModel.swift
//  LedScroller
//
//  Created by darktech4 on 15/05/2024.
//

import SwiftUI

struct DataModel:Identifiable{
    var id = UUID()
    var item: String = ""
    var font: String = "ChalkboardSE-Regular"
    var sizs: CGFloat = 100
    var color: Color = .bc
}
