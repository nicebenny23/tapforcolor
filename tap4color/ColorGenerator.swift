//
//  ColorGenerator.swift
//  tap4color
//
//  Copyright © 2020 Benny Inc. All bennys reserved.
//

import Foundation
import UIKit

extension MainViewController
{
    /* Global variables:
     - backgroundColor: UIColor
     */

    // This function should generate a random number between 0-255
    func generateRandomNumber() -> UInt8 {
        // Instructions: Using a UInt8 static function (UInt8.something()), return a random number between 0-255.

        return UInt8.random(in: 0...255)
    }

    // This function should generate a list containing three (3) numbers.
    func generateThreeNumbers() -> [UInt8] {
        // FILL ME IN! :)

        // Instructions: Using a for loop, create and return a list of
        //               three (3) random numbers between 0-255.
        var color: [UInt8] = []
        for _ in 1...3 {
            color.append(generateRandomNumber())
        }
        //print(color)
        return color
    }

    // This function should generate a random RGB (red-green-blue) color.
    func generateRandomColor() -> UIColor {
        // FILL ME IN! :)

        // Instructions: Using generateThreeNumbers(), create and return a new UIColor object.
        // Hint: Use constructor UIColor(displayP3Red...)
        let colorstore = generateThreeNumbers()
        let color = UIColor(displayP3Red: CGFloat(colorstore[0])/255.0, green: CGFloat(colorstore[1])/255.0, blue: CGFloat(colorstore[2])/255.0, alpha: 1.0)
        return color
    }

    // Assign a randomly generated color to the backgroundColor variable
    func updateColor() {
         backgroundColor = generateRandomColor()
        
    }
}
