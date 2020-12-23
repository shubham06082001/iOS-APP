//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController

{
    

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        
        searchTextField.delegate = self
    }

    @IBAction func locationPressed(_ sender: UIButton)
    {
        locationManager.requestLocation()
    }
    


    
}
//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate
{
        @IBAction func searchPressed(_ sender: UIButton) {
            //auto hide keyboard
            searchTextField.endEditing(true)
            //print the input on screen
    //        print(searchTextField.text!)
        }
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text != ""
            {
                return true
            }
            else{
                textField.placeholder = "Please enter a city name!"
                return false
                
            }
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            //auto hide keyboard
            searchTextField.endEditing(true)
            print(searchTextField.text!)
            return true
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            if let city = searchTextField.text{
                weatherManager.fetchWeather(cityName: city)
            }
            searchTextField.text = ""
        }
    
}

//MARK: - Weather Manager Delegate

extension WeatherViewController: WeatherManagerDelegate
{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
      // toprotect the app from crash
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.last
        {
            locationManager.stopUpdatingLocation()
            let lat =  location.coordinate.latitude
            let lon = location.coordinate.longitude
//            print(lat)
//            print(lon)
            weatherManager.fetchWeather(latitude: lat,longitude: lon)
            
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print(error)
    }
}



