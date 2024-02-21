//
//  SplashScreenView.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 22.02.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size: CGFloat = 0.5
    @State private var opacity = 0.0
    
    var body: some View {
        
        if isActive {
            WelcomeView()
        }else {
            GeometryReader{ make in
                VStack {
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: make.size.width/3, height: make.size.width/3)
                        CustomText.getText(text: "Shaurma Food", size: 46, font: .Black)
                            .foregroundColor(.white)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation {
                            self.size = 0.8
                            self.opacity = 1.0
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(CustomColor.brightRed)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    SplashScreenView()
}
