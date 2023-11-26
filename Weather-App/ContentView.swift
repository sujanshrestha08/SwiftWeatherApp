 //
//  ContentView.swift
//  Weather-App
//
//  Created by Sujan on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Kathmandu, Nepal", fontSize: 32)
                MainWeatherStatus(isNight: isNight)
                
                HStack (spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue", weatherImage: "cloud.sun.fill", temperature: "74")
                    WeatherDayView(dayOfWeek: "WED", weatherImage: "sun.max.fill", temperature: "88")
                    WeatherDayView(dayOfWeek: "THU", weatherImage: "wind.snow", temperature: "55")
                    WeatherDayView(dayOfWeek: "FRI", weatherImage: "sunset.fill", temperature: "60")
                    WeatherDayView(dayOfWeek: "SAT", weatherImage: "snow", temperature: "25")
                }
                
                Spacer()
                
                Button() {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
                
            }
            
        }
    }
}

    
    #Preview {
        ContentView()
    }
    
    struct WeatherDayView: View {
        var dayOfWeek : String
        var weatherImage: String
        var temperature: String
        
        var body: some View {
            VStack{
                Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
                Image(systemName: weatherImage).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
                Text("\(temperature)°").font(.system(size: 28, weight: .medium, design: .default)).foregroundColor(.white)
            }
        }
    }
    
    struct BackgroundView: View {
        
         var isNight: Bool
        
//        var topColor : Color
//        var bottomColor: Color
        
        var body: some View {
            
            /*
             Please Note
             
             Linear Gradient can be used above ios 15
             and to use ContainerRelativeShape
             you must be at iops 16*/
            
            
//            LinearGradient(gradient:
//                            Gradient(colors: [
//                                isNight ? .black : .blue,
//                                isNight ? .gray :  Color("lightBlue")]),
//                           startPoint: .topLeading,
//                           endPoint: .bottomTrailing)
//            .ignoresSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ContainerRelativeShape()
                .fill(isNight
                      ? Color.black.gradient
                      : Color.blue.gradient)
                .ignoresSafeArea()
        }
    }
    
    struct CityTextView: View {
        var cityName: String
        var fontSize: Int
        var body: some View {
            Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
        }
    }
    
    struct MainWeatherStatus: View {
        
       var isNight : Bool
        
//        var imageName: String
//        var temperature: Int
        var body: some View {
            VStack(spacing: 8){
                Image(systemName: isNight ? "moon.stars.fill": "cloud.sun.fill").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 180, height: 180)
                Text("76°").font(.system(size: 72, weight: .medium)).foregroundColor(.white)
            }.padding(.bottom, 40)
        }
    }
    
 

