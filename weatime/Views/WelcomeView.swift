//
//  WelcomeView.swift
//  weatime
//
//  Created by Max Victor on 11/03/2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack(spacing: 20){
            
            VStack{
                Text("Welcome to The WeaTime App")
                    .bold()
                    .font(.title)
                
                Text("Please, share your current location to get the weather in your area.")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareMyCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
