//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by SHUBHAM KUMAR on 18/04/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    
    var bmi: BMI?
    
    
    func getBMIValue() ->String
    {
        
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
        
    }
    func getAdvice() -> String
    {
        return bmi?.advice ?? "NO ADVICE"
    }
    func getColor() -> UIColor
    {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    
    
    mutating func calculateBMI(height: Float, weight: Float)
    {
        let bmiValue = weight / (height*height)
        
        if bmiValue < 18.5
        {
            bmi = BMI(value: bmiValue, advice: "EAT MORE PIES!", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        }
        else if bmiValue < 24.9
        {
            bmi = BMI(value: bmiValue, advice: "FIT AS A FIDDLE!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else
        {
            bmi = BMI(value: bmiValue, advice: "EAT LESS PIES!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
        
        
    }
}
