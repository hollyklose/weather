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
    @IBOutlet weak var windMph: UIStackView!
    
    var currentWeather: CurrentWeather!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        currentWeather = CurrentWeather(city: "4317656")
        
        currentWeather.downloadWeather { () -> () in

        }
     
        
        
        
        
        
    }

    
    
    


}

