//
//  WeatherButton.swift
//  Weather-App
//
//  Created by Sujan on 29/11/2023.
//

import SwiftUI

struct WeatherButton : View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Text(title).frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Tile",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
