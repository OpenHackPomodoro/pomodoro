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
    var timeInSec = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // this code are example code
        totalTimeInSec = 30
        if let totalTime = totalTimeInSec {
            timeInSec = totalTime
        }
//        timeInSec = totalTimeInSec!
        
        pauseBtn.isHidden = true
        stopBtn.isHidden = true
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.trackColor = UIColor.gray
        progress.set(colors: UIColor.red ,UIColor.red, UIColor.red, UIColor.red, UIColor.red)
        progress.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        view.addSubview(progress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var PomoCount: UILabel!
    
    @IBOutlet var PomoInterval: UITextField!
    
//   @IBAction func animatePlayBtn(_ sender: Any) {
//        progress.animate(fromAngle: 0, toAngle: 360, duration: 5) { completed in
//            if completed {
//                //                print("animation stopped, completed")
//                //                self.count = Int(self.PomoCount.text!)!
//                print(self.PomoCount.text)
//                if let rawText1 = self.PomoCount.text {
//                    print(rawText1)
//                    self.rawText = rawText1
//                }
//                if let tmp1 = Int(self.rawText){
//
//                    self.count = tmp1
//                    self.count += 1
//                    print(self.count)
//
//                }
//                self.timeInSec = 30
//            } else {
//                print("animation stopped, was interrupted")
//            }
//        }
//    }
    func getTimeFromTextField() -> Int{
        return Int(PomoInterval.text!)!
        
    }
    @IBOutlet var timerButton: UIButton!
    @IBAction func timerAction(_ sender: UIButton) {
        //get time of textField
        
        totalTimeInSec = Double(getTimeFromTextField())
        
        if sender.titleLabel!.text == "START" {
            resetCounter()
            // pause, stop hidden, start show
            pauseBtn.isHidden = true
            stopBtn.isHidden = true
            timerButton.isHidden = false
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.changeLabelText), userInfo: nil, repeats: true)
            timerButton.setTitle("Paused", for: [])
            
            timerButton.isHidden = true
            pauseBtn.isHidden = false
            stopBtn.isHidden = false
        }else {
            // start hidden pause, stop show
            
            
            
            timer!.invalidate()
            timerButton.setTitle("START", for: [])
//            progress.animateFromAngle(progress.angle, toAngle: 0, duration: 0.5, completion: nil)
            
            progress.animate(fromAngle: progress.angle, toAngle: 0, duration: 0.5) { completed in
                if completed{
                    //animate 끝났을 때
                    print("Animate cycle finished!")
                    self.count += 1
                    print(self.count)
                    self.progress.set(colors: UIColor.yellow)
                }
                else {
                    //animate 비정상적 종료
                    print("Stopped!")
                }
            }
        }
    }
    func resetCounter () {
        if let totalTime = totalTimeInSec{
            timeInSec = totalTime
        }
//        timeInSec = totalTimeInSec!
    }
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func animatePause(_ sender: UIButton) {
        // pause animate
        progress.pauseAnimation()
    }
    @IBOutlet var pauseBtn: UIButton!
    
    @IBAction func animateStop(_ sender: UIButton) {
        // stop animate
        progress.stopAnimation()
    }
    
    @IBOutlet var stopBtn: UIButton!
    
    @objc func changeLabelText() {
        
        timeInSec -= 1
        if timeInSec == -1{
            timeInSec = Double(totalTimeInSec!)
        }
        let newAngleValue = Double(newAngle())
        
        progress.animate(toAngle: newAngleValue, duration: 0.5, completion: nil)
        let (_,m,s) = secondsToHoursMinutesSeconds(seconds: Int(timeInSec))
        
        timerLabel.text = "\(m):\(s)"
    }
    
    func newAngle() -> Int {
        return Int(360 * (timeInSec / totalTimeInSec!))
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

//    func simpleAlert (title:String,message:String,style:UIAlertActionStyle = UIAlertActionStyle.default,button:String = "OK") {
//
//        let alertController = UIAlertController(title: title, message:   "n" + message, preferredStyle: UIAlertControllerStyle.alert)
//        alertController.addAction(UIAlertAction(title: button, style: style,handler: nil))
//        self.present(alertController, animated: true, completion: nil)
//    }
//
//    func saveToUserDefault(key:String,value:String) {
//
//        UserDefaults.standard.setValue(value, forKey: key)
//
//    }
//
//    func getFromUserDefault(key:String) -> String? {
//
//        let defaults = UserDefaults.standard
//
//        if let value = defaults.string(forKey: key) {
//            return value
//        } else {
//            return nil
//        }
//    }
//
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        if let timerData = getFromUserDefault(key: "Timer") {
//            self.totalTimeInSec = Double(timerData)! * 60.0
//        } else {
//            self.totalTimeInSec = 60.0
//            saveToUserDefault(key: "Timer", value: "(1)")
//        }
        self.totalTimeInSec = 30
    }
}

