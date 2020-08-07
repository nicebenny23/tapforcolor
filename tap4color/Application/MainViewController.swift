//
//  ViewController.swift
//  tap4color
//
//  Copyright © 2020 Benny Inc. All bennys reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var tapCountLabel: UILabel!
    @IBOutlet weak var currentColorLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    // Global variables
    var backgroundColor: UIColor = UIColor.white { // The color of the screen
        didSet { didUpdateBackgroundColor() }
    }

    var tapCount: Int = 0 { // The current count of taps
        didSet { didUpdateTapCount() }
    }

    // This function gets called whenever the user taps the view
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        // Change the background color
        updateColor()

        // Update the tap counter
        updateCounter()

        // Change the color label
        updateColorLabel()
        
        // debug
//        _ = generateThreeNumbers()
//        _ = generateRandomColor()
    }
}

// Setup
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tapCount = 0
        let highscorekey = "high"
        highScoreLabel.text="\(UserDefaults.standard.integer(forKey:highscorekey))"

        let labelColor: UIColor = determineLabelColor()
        tapCountLabel.textColor = labelColor
        currentColorLabel.textColor = labelColor
    }

    func didUpdateBackgroundColor() {
        backgroundColorView.backgroundColor = backgroundColor

        let labelColor: UIColor = determineLabelColor()
        tapCountLabel.textColor = labelColor
        currentColorLabel.textColor = labelColor
    }

    func didUpdateTapCount() {
        tapCountLabel.text = String(tapCount)

        if  !tap100() {
          
            _=tap50()
        }
        
        
        
        if  !tap100() {
          
        if !tap50(){
        
        _=tap10()
           }
            }
    }
    
    
    @IBAction func resetscore(){
    tapCount = 0


    }
}

