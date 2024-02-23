//
//  VerifyMobileCodeView.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct VerifyMobileCodeView: View {
    
    private var mobile: String
    @State private var code: [String] = [
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    @FocusState private var focusIndex: Int?
    @State private var colorForLodingCircle = Gradient(colors: [.red, .red.opacity(0.2), .red.opacity(0.4), .red.opacity(0.6), .red.opacity(0.8)])
    
    @State private var otp = false
    @State private var secondRetry = 30
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(_ mobile: String){
        self.mobile = mobile
    }
    
    var body: some View {
        NavigationView{
            GeometryReader{ make in
                
                VStack{
                    textFieldsView
                    HStack{
                        lodingCircle()
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                        CustomText.getText(text: (otp ? "OTP found" : "Auto fetching OTP"), size: 14, font: .Thin)
                            .foregroundColor(Color(hex: "#595959"))
                        Spacer()
                    }
                    
                    CustomButton.btn(text: "Continue", size: 18, color: CustomColor.brightRed.opacity(otp ? 1: 0.6), action: actionForContinueBtn(), width: .infinity, height: make.size.height/12)
                        .padding()
                        .disabled(!otp)
                    
                    HStack{
                        retryInfo
                            .padding(.leading)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle("Verify with OTP sent to \(mobile)")
        .onAppear{
            focusIndex = 0
        }
    }
}

extension VerifyMobileCodeView{
    
    
    private var retryInfo: some View {
        CustomText.getText(text: (  secondRetry == 0 ? "Retry" : "Didn’t get the OTP? Retry in \(secondRetry)s"), size: 14, font: .Regular)
            .foregroundColor(secondRetry == 0 ? CustomColor.brightRed : Color(hex: "#595959"))
            .underline(secondRetry == 0)
            .onReceive(timer, perform: { _ in
                if secondRetry > 0 {
                    secondRetry -= 1
                }
            })
    }
    
    private func actionForContinueBtn() {
        
    }
    
    private var textFieldsView: some View {
        HStack{
            ForEach(code.indices) { index in
                getTextField(TextField("", text: $code[index]), stateOtp: $otp)
                    .focused($focusIndex, equals: index)
                    .onChange(of: code[index]){
                        if focusIndex! < code.count - 1 {
                            if !$0.isEmpty{
                                focusIndex = index + 1
                            }
                        }else{
                            otp = true
                            colorForLodingCircle = Gradient(colors: [.red])
                        }
                    }
            }
        }
        .padding()
        
    }
    
    private func lodingCircle() -> some View {
        let grandientForLodingCircle = AngularGradient(gradient: colorForLodingCircle, center: .center)
        return Circle()
            .strokeBorder(grandientForLodingCircle, lineWidth: 3)
    }
}

#Preview {
    VerifyMobileCodeView("7002419495")
}
