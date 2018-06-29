//
//  TogetherViewController.swift
//  Pomodoro
//
//  Created by 권용진 on 2018. 6. 30..
//  Copyright © 2018년 Jin. All rights reserved.
//

import UIKit

class TogetherViewController: UIViewController, UIScrollViewDelegate {
    var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return #imageLiteral(resourceName: "Together")
        }
        set {
            imageView.image = #imageLiteral(resourceName: "Together")
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil{
            fetchImage()
        }
    }
    
    private func fetchImage(){
        imageView.image = #imageLiteral(resourceName: "Together")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//
//
//import UIKit
//
//class ImageViewController: UIViewController, UIScrollViewDelegate {
//    var imageURL: URL? {
//        didSet {
//            image = nil
//            if view.window != nil{
//                fetchImage()
//            }
//        }
//    }
//
//    private var image: UIImage? {
//        get {
//            return imageView.image
//        }
//        set {
//            imageView.image = newValue
//            imageView.sizeToFit()
//            scrollView.contentSize = imageView.frame.size
//        }
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if imageView.image == nil{
//            fetchImage()
//        }
//    }
//
//    @IBOutlet weak var scrollView: UIScrollView! {
//        didSet {
//            scrollView.minimumZoomScale = 1/25
//            scrollView.maximumZoomScale = 1.0
//            scrollView.delegate = self
//            scrollView.addSubview(imageView)
//        }
//    }
//
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return imageView
//    }
//    var imageView = UIImageView()
//
//    private func fetchImage(){
//        if let url = imageURL {
//            let urlContents = try? Data(contentsOf: url)
//            if let imageData = urlContents{
//                image = UIImage(data: imageData)
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
//    }
//}
