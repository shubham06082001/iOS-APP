//
//  WeatherManager.swift
//  Clima
//
//  Created by SHUBHAM KUMAR on 19/04/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate
{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=a37606c801c31482a92983a09e13306f&units=metric"
    
    var  delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String)
    {
        let urlString = "\(weatherURL)&q=\(cityName)"
        //        print(urlString)
        performRequest(with: urlString)
    }
    func fetchWeather(latitude:  CLLocationDegrees, longitude: CLLocationDegrees)
    {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
        
    }
    func performRequest(with urlString: String)
    {
        //steps required for networking
        //1.create an url
        if let url = URL(string: urlString){
            
            //2.create an urlsession
            let session = URLSession(configuration: .default)
            //3.give the session a task
            let task = session.dataTask(with: url)
            { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data
                {
                    if let weather =  self.parseJSON( safeData){
                        //enetring delegates
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                    }
                }
            }
            //4.start the task
            task.resume()
            
        }
    }
    
    func parseJSON(_ weatherData: Data) ->WeatherModel?
    {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.conditionName)
            return weather
            
        }catch{
            
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}


