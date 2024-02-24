//
//  RegisterUserView.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 24.02.2024.
//

import SwiftUI

struct RegisterUserView: View {
    
    @State private var email = ""
    @State private var name = ""
    @State private var status = false
    
    var body: some View {
        NavigationView {
            GeometryReader { make in
                
                VStack{
                    
                    title("Name")
                        
                    nameField
                    
                    title("Email (optional)")
                        .padding(.top)
                    emailField
                        
                    btn(height: make.size.height/14)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear{
                    status = !name.isEmpty || !email.isEmpty
                }
            }
        }
        .navigationTitle("Help us to get to know you")
    }
}

extension RegisterUserView {
    
    private func btn(height: CGFloat) -> some View {
        CustomButton.btn(text: "Confirm Details", size: 18, color:  CustomColor.brightRed.opacity(status ? 1 : 0.6), action: actionForBtn, width: .infinity, height: height)
            .padding()
            .disabled(!status)
    }
    
    private func actionForBtn(){
        
    }
    
    private func title(_ text: String) -> some View{
        HStack{
            CustomText.getText(text: text, size: 14, font: .Regular)
                .foregroundColor(Color(hex: "#595959"))
                .padding([.leading,.trailing])
                
            Spacer()
        }
    }
    private var nameField: some View {
        getTextField("Enter your name", stateText: $name)
            .onChange(of: name) {
                if !name.isEmpty || !email.isEmpty{
                    status = true
                }else {
                    status = false
                }
            }
    }
    
    private var emailField: some View {
        getTextField("Enter your email", stateText: $email)
            .onChange(of: email) {
                if !name.isEmpty || !email.isEmpty{
                    status = true
                }else {
                    status = false
                }
            }
    }
}

#Preview {
    RegisterUserView()
}
