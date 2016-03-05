//
//  CurrentWeather.swift
//  weather
//
//  Created by Holly Klose on 3/1/16.
//  Copyright © 2016 Holly Klose. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    
    private var _weatherIcon: String!
    private var _weatherTemp: String!
    private var _weatherDesc: String!
    private var _weatherHumid: String!
    private var _weatherWind: String!
    var cityId: String!
    
    var weatherIcon: String {
        
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
    
    return _weatherIcon
    }
    
    var weatherTemp: String {
        if _weatherTemp == nil {
            _weatherTemp = ""
        }
        return _weatherTemp
    }
    
    var weatherDesc: String {
        if _weatherDesc == nil {
            _weatherDesc = ""
        }
        return _weatherDesc
    }
    
    var weatherHumid: String {
        if _weatherHumid == nil {
            _weatherHumid = ""
        }
        return _weatherHumid
    }
    
    var weatherWind: String {
        if _weatherWind == nil {
            _weatherWind = ""
        }
        return _weatherWind
    }
    
    init(city: String) {
        cityId = city
    }
    
    
    typealias DownloadComplete = () -> ()

    
    func downloadWeather(completed: DownloadComplete) {
        
        
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?zip=02111,us&APPID=3c257522fc193a6750f673e02e05bd16&units=imperial")!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
 //           print(result.value.debugDescription)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let temp = main["temp"] as? Int {
                        self._weatherTemp = "\(temp)"
                        print(self._weatherTemp)
                    }
                    
                    if let humid = main["humidity"] as? Int {
                        self._weatherHumid = "\(humid)"
                        print(self._weatherHumid)
                    }
                    
                    
                }
                
                if let wind = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let speed = wind["speed"] as? Int {
                        self._weatherWind = "\(speed)"
                        print(self.weatherWind)
                    }
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let description = weather[0]["description"] {
                        self._weatherDesc = description.capitalizedString
                        print(self._weatherDesc)
                    }
                    if weather.count > 1 {
                        
                        for var x = 1; x < weather.count; x++ {
                            if let description = weather[x]["description"] {
                                print("bleh")
                                self._weatherDesc! += ", \(description.capitalizedString)"
                            }
                            
                        }
                    
                    }
                    
                    //grab "main", only the first one for icon
                    if let icon = weather[0]["main"] as? String {
                        self._weatherIcon = icon.capitalizedString
                        print(self._weatherIcon)
                        
                        if self._weatherIcon == "Clouds" || self._weatherIcon == "Mist" {
                            self._weatherIcon = "cloudy.png"
                        }
                        
                        if self._weatherIcon == "Atmosphere" || self._weatherIcon == "Additional" {
                            self._weatherIcon = "partly-cloudy.png"
                        }
                        
                        if self._weatherIcon == "Rain" || self._weatherIcon == "Drizzle" {
                            self._weatherIcon = "rainy.png"
                        }
                        
                        if self._weatherIcon == "Snow" {
                            self._weatherIcon = "snowing.png"
                        }
                        
                        if self._weatherIcon == "Thunderstorm" || self._weatherIcon == "Extreme" {
                            self._weatherIcon = "storm.png"
                        }
                        
                        if self._weatherIcon == "Clear" {
                            self._weatherIcon = "sunny.png"
                        }
                        
                    }
                    
                    
                } else {
                    self._weatherIcon = ""
                }
                
                
            
            }

            completed()
        }
        
    }
    
    
    
    
}
