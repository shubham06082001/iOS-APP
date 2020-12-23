//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //creating dictionary
    let eggTimes=["Soft": 30, "Medium": 4,"Hard": 7]
    
    var totalTime: Float=0.0
    var secondsPassed:Float = 0.0
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var timer=Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!;
        secondsPassed=0
        progressBar.progress=0.0
        titleLabel.text = hardness
        
        
        
        
        
        
        //using dictionary
        //        print(eggTimes[hardness]!)
        
        totalTime=Float(eggTimes[hardness]!)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
        
    }
    
    
    @objc func updateTimer()
    {
        if secondsPassed<totalTime{
            secondsPassed += 1
            let p = secondsPassed/totalTime
            progressBar.progress=p
            titleLabel.text=String(secondsPassed)+" seconds passed"
            
        }
        if Int(secondsPassed) == Int(totalTime){
            timer.invalidate()
            titleLabel.text="Done!"
            playSound()
            progressBar.progress=1.0
            
            
            
        }
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}





