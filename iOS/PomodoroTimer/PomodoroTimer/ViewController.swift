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
    
    @IBOutlet var roundedCornerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // this code are example code
        totalTimeInSec = 30
        if let totalTime = totalTimeInSec {
            timeInSec = totalTime
        }
//        timeInSec = totalTimeInSec!
        
        self.roundedCornerView.layer.cornerRadius = 3
        self.pauseBtn.layer.cornerRadius = 10
        self.timerButton.layer.cornerRadius = 10
        
        pauseBtn.isHidden = true
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
        progress.startAngle = -90
        progress.progressThickness = 0.5
        progress.trackThickness = 0.5
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .forward
        progress.glowAmount = 0
        
        let myRed = UIColor(red:0.96, green:0.38, blue:0.31, alpha:1.0)
        let myGray = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        
        progress.trackColor = myGray
        progress.set(colors: myRed ,myRed, myRed, myRed,myRed)
        progress.center = CGPoint(x: view.center.x, y: view.center.y)
        view.addSubview(progress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var PomoCount: UILabel!
    
    
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
    
    @IBOutlet var PomoCountLabel: UILabel!
    @IBOutlet var timerButton: UIButton!
    @IBAction func timerAction(_ sender: UIButton) {
        //get time of textField
        
        totalTimeInSec = 15
        
        if sender.titleLabel!.text == "START" {
            resetCounter()
            // pause, stop hidden, start show
            pauseBtn.isHidden = true
            
            timerButton.isHidden = false
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.changeLabelText), userInfo: nil, repeats: true)
            
            timerButton.isHidden = true
            pauseBtn.isHidden = false
            
        }else {
            // start hidden pause, stop show
            
            
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
        
        timerButton.isHidden = false
        pauseBtn.isHidden = true
        
        
        timer!.invalidate()
        timerButton.setTitle("START", for: [])
        //            progress.animateFromAngle(progress.angle, toAngle: 0, duration: 0.5, completion: nil)
        
        progress.animate(fromAngle: progress.angle, toAngle: 0, duration: 0.5) { completed in
            if completed{
                //animate 끝났을 때
                print("Animate cycle finished!")
                self.count += 1
                print(self.count)
                
            }
            else {
                //animate 비정상적 종료
                print("Stopped!")
            }
        }
    }
    @IBOutlet var pauseBtn: UIButton!
    

    @objc func changeLabelText() {
        
        timeInSec -= 1
        if timeInSec == -1{
            timeInSec = Double(totalTimeInSec!)
//            self.progress.set(colors: UIColor.yellow)
            self.progress.progressColors = [UIColor.yellow]
            
            print("휴식뽀모 시작")
            self.PomoCountLabel.text = "1"
            let alert = UIAlertController(title: "뽀모도로 하나 완성!", message: "5분의 휴식을 즐기세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("확인", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        let newAngleValue = Double(newAngle())
        
        progress.animate(toAngle: newAngleValue, duration: 0.5, completion: nil)
        let (_,m,s) = secondsToHoursMinutesSeconds(seconds: Int(timeInSec))
        if timeInSec == -1 {
            totalTimeInSec = 300
        }
        timerLabel.text = "\(m) : \(s)"
    }
    
    func newAngle() -> Int {
        return Int(360 * (timeInSec / totalTimeInSec!))
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    
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
