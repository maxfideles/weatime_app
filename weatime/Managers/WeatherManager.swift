//
//  WeatherManager.swift
//  weatime
//
//  Created by Max Victor on 11/03/2023.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitute: CLLocationDegrees, longitute: CLLocationDegrees) async throws -> ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitute)&lon=\(longitute)&appid=\("65595f6d2ee627c1bbd68e3074f985e3")&units=metric") else {fatalError("Missgin URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) =  try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{fatalError("Error fecthing weather data") }
        
       let decodedData =  try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
            
    }
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var clouds : CloudResponse
   

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct CloudResponse: Decodable{
        var all: Double
        
    }
    

}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

extension ResponseBody.CloudResponse{
    var Cloudsall: Double {return all}
}


