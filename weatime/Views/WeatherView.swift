//
//  WeatherView.swift
//  weatime
//
//  Created by Max Victor on 11/03/2023.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack{
            
            if (weather.weather[0].main == "Rain") || (weather.weather[0].main == "Thunderstorm"){
                
                LinearGradient(colors: [Color(.gray).opacity(0.3),.white], startPoint: .topLeading, endPoint: .bottom)
                LinearGradient(colors: [Color(.blue).opacity(0.4),Color(.lightGray).opacity(0.3)], startPoint: .bottomLeading, endPoint: .trailing)
                Circle()
                    .foregroundColor(Color(.gray).opacity(0.3))
                    .frame(width:300, height:300)
                    .offset(x:-150,y:-150)
                
            }else if (weather.weather[0].main == "Clouds") || (weather.weather[0].main == "Mist"){
                
                LinearGradient(colors: [.blue,.white], startPoint: .top, endPoint: .trailing)
                    .blur(radius: 10)
                LinearGradient(colors: [Color(.blue).opacity(0.5),Color(.white).opacity(0.3)], startPoint: .bottomLeading, endPoint: .trailing)
                    .blur(radius: 5)
                
                
        }else if (weather.weather[0].main == "Snow"){
            
            LinearGradient(colors: [.blue,.white], startPoint: .top, endPoint: .trailing)
                .blur(radius: 10)
            LinearGradient(colors: [Color(.blue).opacity(0.5),Color(.white).opacity(0.3)], startPoint: .bottomLeading, endPoint: .trailing)
                .blur(radius: 5)
            
            
            VStack {
                Image("snow")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x:-34,y:-40)
                .opacity(0.3)
                Image("snow")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x:30,y:58)
                .opacity(0.3)
                Image("snow")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x: -87, y: 92)
                .opacity(0.3)
                Image("snow")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x: 93, y: 180)
                .opacity(0.3)
            }
            
            
        }
            
            else{
                LinearGradient(colors: [.blue,.white], startPoint: .top, endPoint: .trailing)
                    .blur(radius: 10)
                LinearGradient(colors: [Color(.blue).opacity(0.5),Color(.white).opacity(0.3)], startPoint: .bottomLeading, endPoint: .trailing)
                    .blur(radius: 5)
                LinearGradient(colors: [Color(.yellow).opacity(0.3),Color(.white).opacity(0.1)], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .blur(radius: 5)
            }
            
            VStack{
                Spacer()
                ZStack{
                    
                    LinearGradient(colors: [Color(.blue).opacity(0.3),Color(.white).opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .cornerRadius(20)
                        .opacity(0.7)
                        .shadow(color: .black, radius: 1, x: 3, y: 4)
                        .blur(radius: 1)
                    
                    VStack{
                        
                        Text("Today, \(Date().formatted(.dateTime.day().month().hour().minute()))")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,
                                   maxHeight: 23,
                                   alignment: .topLeading)
                            .padding()
                            .bold()
                        HStack{
                            Text(weather.name)
                                .font(.system(size: 35,weight: .semibold))
                                .padding()
                            Spacer()
                            VStack{
                                //Spacer()
                                Text(weather.main.temp.roundDouble() + "°")
                                //.offset(y:-40)
                                    .font(.system(size: 60,weight: .semibold))
                                    .frame(alignment: .trailing)
                                Spacer()
                                if (weather.weather[0].main == "Clouds"){
                                    Image("cloud")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .offset()
                                }else if (weather.weather[0].main == "Clear"){
                                    Image("sunny")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .offset()
                                }else if (weather.weather[0].main == "Rain"){
                                    Image("rain")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .offset()
                                } else if (weather.weather[0].main == "Thunderstorm"){
                                Image("thunderstorm")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .offset()
                            }else if (weather.weather[0].main == "Mist"){
                                Image("mist")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .offset()
                            }else if (weather.weather[0].main == "Snow"){
                                Image("snow")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .offset()
                            }
                                
                                //Spacer()
                                
                            }
                        }
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .leading)
                        
                        Text(weather.weather[0].main)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15, weight: .bold))
                            .padding(.leading)
                    }
                    
                    
                }
                .frame(width: 350,height: 200)
                
                Spacer()
                
                //details
                VStack {
                    Spacer()
                    //minimum and maximum
                    HStack{
                        Spacer()
                        //Minimum
                        ZStack{
                            
                            LinearGradient(colors: [Color(.blue),Color(.white)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(20)
                                .opacity(0.25)
                                .shadow(color: .black, radius: 4, x: 3, y: 10)
                            
                            VStack{
                                
                                HStack {
                                    Image(systemName: "thermometer.low")
                                       
                                    Text("Minimum")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity,
                                               maxHeight: 23,
                                               alignment: .leading)
                                        
                                        .bold()
                                    
                                }
                                .padding(10)
                                
                                HStack{
                                    VStack{
                                        //Spacer()
                                        Text(weather.main.temp_min.roundDouble() + "°")
                                        //.offset(y:-40)
                                            .font(.system(size: 30,weight: .semibold))
                                            .frame(alignment: .center)
                                    }
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity)
                            }
                            
                            
                        }
                        .frame(width: 150,height: 100)
                        Spacer()
                        
                        //Maximum
                        ZStack{
                            
                            LinearGradient(colors: [Color(.blue),Color(.white)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(20)
                                .opacity(0.25)
                                .shadow(color: .black, radius: 4, x: 3, y: 10)
                            
                            VStack{
                                
                                HStack {
                                    Image(systemName: "thermometer.high")
                                        //.foregroundColor(.gray)
                                    Text("Maximum")
                                        
                                        .frame(maxWidth: .infinity,
                                               maxHeight: 23,
                                               alignment: .leading)
                                        
                                    .bold()
                                    
                                }
                                .padding(10)
                                HStack{
                                    VStack{
                                        
                                        Text(weather.main.temp_max.roundDouble() + "°")
                                            .font(.system(size: 30,weight: .semibold))
                                            .frame(alignment: .center)
                                    }
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity)
                            }
                            
                            
                        }
                        .frame(width: 150,height: 100)
                        Spacer()
                        
                    }
                    .padding(.bottom)
                    
                  //Feels Like and Humidity
                    HStack{
                        Spacer()
                        
                        //Feels Like
                        ZStack{
                            
                            LinearGradient(colors: [Color(.blue),Color(.white)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(20)
                                .opacity(0.25)
                                .shadow(color: .black, radius: 4, x: 3, y: 10)
                            
                            VStack{
                                //feels like
                                HStack {
                                    Image(systemName: "thermometer.medium")
                                       
                                    Text("Feels Like")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity,
                                               maxHeight: 23,
                                               alignment: .leading)
                                        
                                        .bold()
                                    
                                }
                                .padding(10)
                                
                                HStack{
                                    VStack{
                                        //Spacer()
                                        Text(weather.main.feels_like.roundDouble() + "°")
                                        //.offset(y:-40)
                                            .font(.system(size: 30,weight: .semibold))
                                            .frame(alignment: .center)
                                    }
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity)
                            }
                            
                        }
                        .frame(width: 150,height: 100)
                        Spacer()
                        
                        //Humidity
                        ZStack{
                            
                            LinearGradient(colors: [Color(.blue),Color(.white)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(20)
                                .opacity(0.25)
                                .shadow(color: .black, radius: 4, x: 3, y: 10)
                            
                            VStack{
                                
                                HStack {
                                    Image(systemName: "humidity")
                                        
                                    Text("Humidity")
                                        
                                        .frame(maxWidth: .infinity,
                                               maxHeight: 23,
                                               alignment: .leading)
                                        
                                    .bold()
                                    
                                }
                                .padding(10)
                                HStack{
                                    VStack{
                                        
                                        Text(weather.main.humidity.roundDouble() + "%")
                                            .font(.system(size: 30,weight: .semibold))
                                            .frame(alignment: .center)
                                    }
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity)
                            }
                            
                            
                        }
                        .frame(width: 150,height: 100)
                        Spacer()
                        
                    }
                    .padding(.bottom)
                    
                    //Clouds and Rain volume for the last 3 hours
                      HStack{
                          Spacer()
                          
                          //Cloudiness
                          ZStack{
                              
                              LinearGradient(colors: [Color(.blue),Color(.white)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                  .cornerRadius(20)
                                  .opacity(0.25)
                                  .shadow(color: .black, radius: 4, x: 3, y: 10)
                              
                              VStack{
                                  
                                  HStack {
                                      Image(systemName: "cloud.fill")
                                         
                                      Text("Cloudiness")
                                          .foregroundColor(.white)
                                          .frame(maxWidth: .infinity,
                                                 maxHeight: 23,
                                                 alignment: .leading)
                                          
                                          .bold()
                                      
                                  }
                                  .padding(10)
                                  
                                  HStack{
                                      VStack{
                                          //Spacer()
                                          Text(weather.clouds.all.roundDouble() + "%")
                                            .font(.system(size: 30,weight: .semibold))
                                             .frame(alignment: .center)
                                      }
                                  }
                                  .frame(maxWidth: .infinity,
                                         maxHeight: .infinity)
                              }
                              
                          }
                          .frame(width: 150,height: 100)
                          Spacer()
                          
                          //Wind Speed
                          ZStack{
                              
                              LinearGradient(colors: [Color(.blue),Color(.white)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                  .cornerRadius(20)
                                  .opacity(0.25)
                                  .shadow(color: .black, radius: 4, x: 3, y: 10)
                              
                              VStack{
                                  
                                  HStack {
                                      Image(systemName: "wind")
                                          
                                      Text("Wind Speed")
                                          
                                          .frame(maxWidth: .infinity,
                                                 maxHeight: 23,
                                                 alignment: .leading)
                                          
                                      .bold()
                                      
                                  }
                                  .padding(10)
                                  HStack{
                                      VStack{
                                          
                                          Text(weather.wind.speed.roundDouble() + " m/s")
                                              .font(.system(size: 30,weight: .semibold))
                                              .frame(alignment: .center)
                                      }
                                  }
                                  .frame(maxWidth: .infinity,
                                         maxHeight: .infinity)
                              }
                              
                              
                          }
                          .frame(width: 150,height: 100)
                          Spacer()
                          
                      }
                      .padding(.bottom)

                    
                    
                    
                    
                    Spacer()
                }
                .frame(width: 350, height: 350)
                Spacer()
                
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color(hue: 0.65, saturation: 0.793, brightness: 0.363))
        .preferredColorScheme(.dark)
        
        
    
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
