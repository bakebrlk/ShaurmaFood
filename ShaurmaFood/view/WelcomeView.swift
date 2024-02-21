//
//  WelcomeView.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { make in
            VStack {
                Spacer()
                image
                title
                description
                Spacer()
                btn(width: make.size.width, height: make.size.height/12)
            }
            .frame(maxWidth: make.size.width, maxHeight: make.size.height)
            .background(CustomColor.white)
            
        }
        
    }
}

extension WelcomeView {
    
    private var image: some View {
        Image("welcome")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.bottom)
    }
    
    private var title: some View {
        CustomText.getText(text: "Welcome to Shaurma Food!", size: 24, font: .ExtraBold)
            .padding()
    }
    
    private var description: some View {
        CustomText.getText(text: "Effortless cooking starts here.\n Get fresh ingredients delivered and cook\n amazing meals in minutes.", size: 14, font: .Thin)
            .foregroundColor(Color(hex: "#4B4B4B"))
            .multilineTextAlignment(.center)
    }
    
    private func btn(width: CGFloat, height: CGFloat) -> some View {
        CustomButton.btn(text: "Get Started", size: 18, color: CustomColor.darkRed, action: actionForStartBnt(), width: width, height: height)
            .padding()
    }
    
    private func actionForStartBnt(){
        
    }
}

#Preview {
    WelcomeView()
}
