//
//  CustomButton.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct CustomButton {
    static func btn(text: String, size: CGFloat, color: Color, action: (), width: CGFloat, height: CGFloat) -> some View {
        Button {
            action
        } label: {
            CustomText.getText(text: text, size: size, font: .Regular)
                .foregroundColor(.white)
        }
        .frame(maxWidth: width, maxHeight: height)
        .background(color)
        .cornerRadius(height/2)
    }
}
