import UIKit
import AVFoundation

// MARK: - A/V Helpers
enum AVHelpers {
    private static var player: AVAudioPlayer?

    static func playMp3(name: String) {
        guard let sound = NSDataAsset(name: name) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

// Easter egg!
extension MainViewController {
    func tap50() -> Bool {
          guard backgroundColor != .white else { return false }

          if tapCount % 50 == 0 {
              AVHelpers.playMp3(name: "cheer")
              return true
          }
          return false
      }
    func tap10() -> Bool {
        guard backgroundColor != .white else { return false }

        if tapCount % 10 == 0 {
            AVHelpers.playMp3(name: "quack")
            return true
        }
        return false
    }
    
    func tap100() -> Bool {
        guard backgroundColor != .white else { return false }

        if tapCount % 100 == 0 {
            AVHelpers.playMp3(name: "congratulations")
            return true
        }
        
        return false
    }
}

/* Helpers */
func createRandomInteger(start: UInt8, end: UInt8) -> UInt8 {
    return UInt8.random(in: start...end)
}

func createColor(R: UInt8, G: UInt8, B: UInt8) -> UIColor {
    return UIColor.init(displayP3Red: convertIntToFloat(R),
                        green: convertIntToFloat(G),
                        blue: convertIntToFloat(B),
                        alpha: 1.0)
}

func convertIntToFloat(_ num: UInt8) -> CGFloat {
    return CGFloat(num).truncatingRemainder(dividingBy: 255.0)
}

func map(valueInRange value:Int, minRange:Int, maxRange:Int, minTarget:Int, maxTarget:Int) -> Int {
    return minTarget + (maxTarget - minTarget) * (value - minRange) / (maxRange - minRange)
}
