//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var key = 0
    
    let example = [(title: "You see a fork in the road.",
                    
                    choice1: "Take a left.",
                    
                    choice2: "Take a right."),
                   
                   (title: "You see tiger.",
                    
                    choice1: "Shout for help.",
                    
                    choice2: "Play dead."),
                   
                   (title: "You find a treasure chest.",
                    
                    choice1: "Open it.",
                    
                    choice2: "Check for traps.")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = example[0].title
        choice1Button.setTitle(example[0].choice1, for: .normal)
        choice2Button.setTitle(example[0].choice2, for: .normal)
        
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        
        if (sender.currentTitle) == example[0].choice1
        {
            key = 1
            updateUI()
        }
        else
        {
            key = 2
            updateUI()
            
        }
    }
    func updateUI()
    {
        storyLabel.text = example[key].title
        choice1Button.setTitle(example[key].choice1, for: .normal)
        choice2Button.setTitle(example[key].choice2, for: .normal)
        
        
    }
    
}

