//
//  ColorLabel.swift
//  tap4color
//
//  Copyright © 2020 Benny Inc. All bennys reserved.
//

import UIKit

extension MainViewController {
    // WARNING: This code MAY contain some bugs...😈

    // Update the color label. This should look like HTML color codes (e.g. #FE4599)
    func updateColorLabel() {
        let redColor = UnsafeMutablePointer<CGFloat>.allocate(capacity: 6)
        let greenColor = UnsafeMutablePointer<CGFloat>.allocate(capacity: 6)
        let blueColor = UnsafeMutablePointer<CGFloat>.allocate(capacity: 6)
        let alpha = UnsafeMutablePointer<CGFloat>.allocate(capacity: 6)

        guard backgroundColor.getRed(redColor, green: greenColor, blue: blueColor, alpha: alpha) else {
            currentColorLabel.text = "ERROR"
            return
        }

        // Contains multiple bugs!

        // Get the actual value ("pointee") from the CGFloat pointer.
        let redValue: CGFloat   = abs(redColor.pointee) * 255.0
        let blueValue: CGFloat  = abs(blueColor.pointee) * 255.0
        let greenValue: CGFloat = abs(greenColor.pointee) * 255.0

        // MISSING: How do you derive an Int value (0-255) using a CGFloat (0.0-1.0)?
        //          Also, how do you convert an Int (250 ->) into a Hex value (-> 0xFA)?
        let redColorString = String(format: "%02X", UInt16(redValue))
        let blueColorString = String(format: "%02X", UInt16(blueValue))
        let greenColorString = String(format: "%02X", UInt16(greenValue))
         print(redColorString)
        
        let colorLabelString = String("#\(redColorString)\(greenColorString)\(blueColorString)")
        // ^ Hint: use String(format: ...)

        // Update the label
        currentColorLabel.text = colorLabelString
    }

    // Determine an appropriate visible color for the UILabels.
    func determineLabelColor() -> UIColor {
        let hue = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let saturation = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let brightness = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let alpha = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)

        guard backgroundColor.getHue(hue, saturation: saturation, brightness: brightness, alpha: alpha) else {
            return .black
        }

        // Instructions: Transform the hue value (0-360) into its inverse (e.g. 50->230, 230->50, 180->0, etc.),
        //               create a UIColor with that hue value, and return it.

        // Hardcoded values: Saturation = 1.0, Lumosity = 0.5, Alpha = 1.0.

        return .blue
    }
}
