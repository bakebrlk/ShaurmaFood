//
//  CustomButton.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct CustomButton {
    static func btn(text: String, size: CGFloat, color: Color, action: ()) -> some View {
        Button {
            action
        } label: {
            CustomText.getText(text: text, size: size)
        }
        .background(color)
        .cornerRadius(20)
    }
}
