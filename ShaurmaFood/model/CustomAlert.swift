//
//  CustomAlert.swift
//  ShaurmaFood
//
//  Created by bakebrlk on 24.02.2024.
//

import SwiftUI
import CoreLocation

struct CustomAlert: View {
    @Binding var isPresented: Bool
    var width: CGFloat
    @State private var locationManager = CLLocationManager()
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                ZStack {
                    Image("locationLogo")
                        
                    Circle()
                        .frame(width: 5,height: 5)
                        .foregroundColor(Color(uiColor: .systemBlue))
                        .padding(.bottom, 6)
                }
                .padding()
                
                CustomText.getText(text: "Allow QuickPrep to access this device’s location?", size: 16, font: .Bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .foregroundColor(Color(hex: "#3F3F3E"))
                    .padding([.top,.bottom])
                
                Button {
                    locationManager.requestWhenInUseAuthorization()
                    isPresented.toggle()
                } label: {
                    CustomText.getText(text: "While using the app", size: 14, font: .Bold)
                        .foregroundColor(Color(UIColor.systemBlue))
                }
               
                Button {
                    locationManager.requestAlwaysAuthorization()
                    isPresented.toggle()
                } label: {
                    CustomText.getText(text: "Only this time", size: 14, font: .Bold)
                        .foregroundColor(Color(UIColor.systemBlue))
                }
                .padding(.top)
                
                Button {
                   
                    isPresented.toggle()
                } label: {
                    CustomText.getText(text: "Don’t allow", size: 14, font: .Bold)
                        .foregroundColor(Color(UIColor.systemBlue))
                }
                .padding([.top,.bottom])

            }
            .frame(maxWidth: width)
            .background(Color(hex: "#323231"))
            .cornerRadius(20)
            .padding()
           
        }
    }
}
