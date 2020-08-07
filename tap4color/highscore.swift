//
//  highscore.swift
//  tap4color
//
//  Created by benny on 7/20/20.
//  Copyright © 2020 Benny Inc. All rights reserved.
//

import Foundation
import UIKit
extension MainViewController{
    func highscore(){
    let highscorekey = "high"
    let currenthighscore = UserDefaults.standard.integer(forKey: highscorekey)
    if tapCount > currenthighscore{
    UserDefaults.standard.set(tapCount, forKey: highscorekey)
        highScoreLabel.text = "\(tapCount)"


        }
    }
}
