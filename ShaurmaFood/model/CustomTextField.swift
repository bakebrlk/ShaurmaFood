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

func getTextField(_ text: String,stateText: Binding<String>) -> some View {
    TextField(text, text: stateText)
        .font(.custom(Font.Montserrat.Bold.rawValue, size: 16))
        .multilineTextAlignment(.leading)
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "#828282B2"), lineWidth: 1)
            )
        .padding([.leading,.trailing])
}
