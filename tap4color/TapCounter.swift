//
//  TapCounter.swift
//  tap4color
//
//  Copyright © 2020 Benny Inc. All bennys reserved.
//

import Foundation
import UIKit

extension MainViewController {
    /* Global variables:
     - tapCount: Int
     */

    // This function should add one (1) to the current `tapCount`
    func updateCounter() {
        tapCount = tapCount + 1;
        highscore()
        // Step 2: ???

        // Step 3: Profit!
    }
}
