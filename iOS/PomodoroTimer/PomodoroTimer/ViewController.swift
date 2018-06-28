//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by KyungYoung Heo on 2018. 6. 29..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//

import UIKit
import KDCircularProgress
import Alamofire

class ViewController: UIViewController {
    var progress: KDCircularProgress!
    var count:Int = 0
    var rawText:String = ""
    
    // these code are example code
    var totalTimeInSec:Double?
    var timer : Timer?
    var timeInSec = 60.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // this code are example code
        timeInSec = totalTimeInSec!
        
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.set(colors: UIColor.cyan ,UIColor.white, UIColor.magenta, UIColor.white, UIColor.orange)
        progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        view.addSubview(progress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var PomoCount: UILabel!
    
    @IBOutlet var PomoInterval: UITextField!
    
    @IBAction func sliderDidChangeValue(_ sender: UISlider) {
        progress.angle = Double(sender.value)*360
    }
    @IBAction func animatePlayBtn(_ sender: Any) {
        progress.animate(fromAngle: 0, toAngle: 360, duration: 5) { completed in
            if completed {
                //                print("animation stopped, completed")
                //                self.count = Int(self.PomoCount.text!)!
                print(self.PomoCount.text)
                if let rawText1 = self.PomoCount.text {
                    print(rawText1)
                    self.rawText = rawText1
                }
                if let tmp1 = Int(self.rawText){
                    
                    self.count = tmp1
                    self.count += 1
                    print(self.count)
                    
                }
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    
    @IBAction func animatePauseBtn(_ sender: Any) {
        progress.pauseAnimation()
    }
    
}

