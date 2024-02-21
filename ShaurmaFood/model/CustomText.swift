//
//  CustomText.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct CustomText {
    static func getText(text: String, size: CGFloat) -> some View{
        Text(text)
            .font(.custom("Montserrat-Regular", size: size))
    }
}