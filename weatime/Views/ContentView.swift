//
//  ContentView.swift
//  weatime
//
//  Created by Max Victor on 11/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationmanager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationmanager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                    
                }else{
                        LoadingView()
                        .task {
                            do{
                              weather = try await weatherManager.getCurrentWeather(latitute: location.latitude, longitute: location.longitude)
                                
                            }
                            catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
                
            }
            
        else{
                if locationmanager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationmanager)
                }
            }
        }
        .background(Color(hue: 0.65, saturation: 0.793, brightness: 0.363))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
