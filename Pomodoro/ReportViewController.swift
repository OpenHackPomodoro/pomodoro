//
//  ReportViewController.swift
//  Pomodoro
//
//  Created by 권용진 on 2018. 6. 29..
//  Copyright © 2018년 Jin. All rights reserved.
//

import UIKit
import WebKit

class ReportViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        let myurl = URL(string:"http://13.230.226.82")
        let myRequest = URLRequest(url: myurl!)
        webView.load(myRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
