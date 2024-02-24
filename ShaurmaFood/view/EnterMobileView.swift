//
//  EnterMobileView.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct EnterMobileView: View {
    
    @State private var mobile = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { make in
                VStack{
                    title
                    textField
                    btn(width: make.size.width, height: make.size.height/12)
                    infoText
                        .padding([.leading,.trailing])
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle("Enter your mobile number to get OTP")
    }
}

extension EnterMobileView {
    
    private var title: some View {
        HStack{
            CustomText.getText(text: "Mobile Number", size: 14, font: .Thin)
                .foregroundColor(Color(hex: "#595959"))
                .padding(.leading)
            Spacer()
        }
        
    }
    
    private var textField: some View {
        HStack {
            CustomText.getText(text: "+7", size: 16, font: .Regular)
                .padding()
            TextField("10 digit mobile number", text: $mobile)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(CustomColor.blackishGrey, lineWidth: 1)
        )
        
        .padding([.leading,.trailing, .bottom])
    }
    
    private func btn(width: CGFloat, height: CGFloat) -> some  View {
        CustomButton.btn(text: "Get OTP", size: 18, color: CustomColor.brightRed, action: actionForGetBtn, width: width, height: height)
            .padding()
    }
    
    private func actionForGetBtn(){
        
    }
    
    private var infoText: some View {
        Text("By clicking, you accept the ")
            .foregroundColor(.gray)
            + Text("Terms of Service")
                .foregroundColor(CustomColor.brightRed)
                .underline()
            + Text(" and ")
                .foregroundColor(.gray)
            + Text("Privacy Policy")
                .foregroundColor(CustomColor.brightRed)
                .underline()
    }
}

#Preview {
    EnterMobileView()
}
