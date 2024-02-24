//
//  AccessLocationView.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 24.02.2024.
//

import SwiftUI

struct AccessLocationView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            GeometryReader { make in
                
                ZStack{
                    VStack{
                        description
                        logo
                        
                        btn(height: make.size.height/14)
                    }
                    
                    if showAlert {
                        CustomAlert(isPresented: $showAlert, width: make.size.width/1.3)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle("What’s your location?")
    }
}

extension AccessLocationView {
    private var description: some View {
        CustomText.getText(text: "Your privacy is important to us, and we only use this information to offer a better service. Thank you!", size: 14, font: .Thin)
            .foregroundColor(Color(hex: "#4B4B4B"))
            .padding()
    }
    
    
    private var logo: some View {
        Image("location1")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private func btn(height: CGFloat) -> some View {
        CustomButton.btn(text: "Allow access to location", size: 18, color: CustomColor.brightRed, action: actionBtn, width: .infinity, height: height)
            .padding()
//            .alert("Hi", isPresented: $showAlert){
//                Button("While using the app") {
//                    print("While using the app")
//                }
//                Button("Only this time") {
//                    print("Only this time")
//                }
//                Button("Don’t allow") {
//                    showAlert = false
//                }
//            }message: {
//                Text("Hello!")
//                    .background(Color.black)
//            }
    }
    
    private func actionBtn() {
        showAlert = true
    }
}

#Preview {
    AccessLocationView()
}
