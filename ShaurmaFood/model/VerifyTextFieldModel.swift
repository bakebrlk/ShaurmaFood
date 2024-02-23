//
//  VerifyTextFieldModel.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

func getTextField(_ textField: TextField<Text>, stateOtp: Binding<Bool>) -> some View {
    textField
        .font(.custom(Font.Montserrat.Bold.rawValue, size: 24))
        .keyboardType(.numberPad)
        .multilineTextAlignment(.center)
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: (stateOtp.wrappedValue ? "#00912F" : "#828282B2")), lineWidth: 1)
            )
}

