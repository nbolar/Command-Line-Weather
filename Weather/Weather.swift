//
//  Weather.swift
//  Weather
//
//  Created by Nikhil Bolar on 2/3/19.
//  Copyright © 2019 Nikhil Bolar. All rights reserved.
//

import Foundation

class Weather
{
    var finished = false
    var apiLaunched = false
    let API_KEY1 = "&appid=691657a05faabbd6ef5736fbcdcf951f"
    func getWeather(location: String){
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(location)&units=metric\(API_KEY1)")
        {
            
            URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                if error != nil
                {
                    print("API Error")
                }
                else
                {
                    if data != nil
                    {
                        let json = try! JSON(data: data!)
                        
                        
                        if let temp = json["main"]["temp"].float
                        {
                            print("\nCurrent Temp: \(temp)°C")

                        }
                        if let min_temp =  json["main"]["temp_min"].float
                        {
                            
                            print("Min Temp: \(min_temp)°C")
                        }
                        
                        if let max_temp =  json["main"]["temp_max"].float
                        {
                            print("Max Temp: \(max_temp)°C")
                        }

                    }
                    
                }
                self.finished = true
                }.resume()
        }
        else
        {
            self.finished = true
        }
    }
}
