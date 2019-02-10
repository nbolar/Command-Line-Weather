//
//  main.swift
//  Weather
//
//  Created by Nikhil Bolar on 2/3/19.
//  Copyright © 2019 Nikhil Bolar. All rights reserved.
//

import Foundation


//print("Hello, World!")

var location = ""
let weather = Weather()

if CommandLine.arguments.count <= 1
{
    print("Provide a Location")
    weather.finished = true
}else{
    for index in 0..<CommandLine.arguments.count{
        if index != 0
        {
            if CommandLine.arguments.count<=2
            {
                location += CommandLine.arguments[index] + ""
            }
            else{
                location += CommandLine.arguments[index] + ","
            }
        }
        
    }
}

while !weather.finished
{
    if !weather.apiLaunched{
        weather.getWeather(location: location)
        weather.apiLaunched = true
        
    }
    
    
}


