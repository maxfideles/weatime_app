//
//  WeatherView.swift
//  weatime
//
//  Created by Max Victor on 11/03/2023.
//

import SwiftUI

struct test: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(weather.name)
                        .bold()
                        .font(.title)
Text("Today, \(Date().formatted(.dateTime.day().month(.wide).year().hour().minute()))")
                        .fontWeight(.light)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                
                Text(weather.main.feelsLike.roundDouble() + "°")
                    .fontWeight(.bold)
                    .font(.system(size: 80))
                
                    HStack{
                    Text(weather.weather[0].main)
                    Image(systemName: "cloud.fill")
                    }
                Text(weather.main.temp_min.roundDouble() + "°")
                    
                
            }
        
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.65, saturation: 0.793, brightness: 0.363))
        .preferredColorScheme(.dark)

    
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test(weather: previewWeather)
    }
}
