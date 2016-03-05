//
//  ViewController.swift
//  weather
//
//  Created by Holly Klose on 3/1/16.
//  Copyright © 2016 Holly Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var percentHumid: UILabel!
    @IBOutlet weak var windMph: UILabel!
    
    var currentWeather: CurrentWeather!

    override func viewDidLoad() {
        super.viewDidLoad()

        currentWeather = CurrentWeather(city: "4317656")
        
        currentWeather.downloadWeather { () -> () in
            self.updateUi()
        }
    }

    func updateUi() {
        weatherDesc.text = currentWeather.weatherDesc
        currentTemp.text = "\(currentWeather.weatherTemp)°"
        percentHumid.text = "\(currentWeather.weatherHumid) % Humidity"
        windMph.text = "\(currentWeather.weatherWind) mph Wind"
        let img = UIImage(named: currentWeather.weatherIcon)
        weatherIcon.image = img
    
        print("icon: \(currentWeather.weatherIcon)")
        print("1 \(currentWeather.weatherDesc)")
        print("2 \(weatherDesc.text)")
        print("weather temp: \(currentWeather.weatherTemp)")
        
    }
    
}

