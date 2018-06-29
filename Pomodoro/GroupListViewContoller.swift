//
//  GroupListViewContoller.swift
//  Pomodoro
//
//  Created by 권용진 on 2018. 6. 29..
//  Copyright © 2018년 Jin. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var limitCount: UILabel!
    @IBOutlet weak var ThumbImage: UIImageView!
    
}

class MyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var fab = Floaty()
    let subview = UIImageView()
    
    @IBOutlet weak var myTableView: UITableView!
    
    var StudyList:[String] = ["하루 25분씩 완성하는 코딩","영알못 탈출 토익"]
    var StudyPeople:[String] = ["1","5"]
    var StudyLimit:[String] = ["2/10", "3/10"]
    var iconFlag:[Int] = [1,0]
    
    //    @IBOutlet weak var BarIcon: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        subview.frame = CGRect(x: 0, y: 1334, width: 375, height: 667)
        subview.image = #imageLiteral(resourceName: "Subview.png")
        view.addSubview(subview)
        subview.layer.cornerRadius = 50
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyListViewController.closeImageView))
        subview.addGestureRecognizer(tapGestureRecognizer)
        subview.isUserInteractionEnabled = true
        
//
//        UITabBar.appearance().tintColor = UIColor.red
//
//        tabBarItem.image = UIImage(named: "file-text")?.withRenderingMode(.alwaysOriginal)
//        tabBarItem.selectedImage = UIImage(named: "file-text copy")?.withRenderingMode(.alwaysOriginal)
//
//
    }
    
    @IBAction func onFabBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.subview.frame.origin.y = 0
        }
        
    }
    
    @objc func closeImageView() {
        UIView.animate(withDuration: 0.5) {
            self.subview.frame.origin.y = 1334
        }
        StudyList.append("답은 9급이다...!")
        StudyPeople.append("1")
        StudyLimit.append("0/10")
        iconFlag.append(2)
        self.myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return StudyList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath) as! GroupTableViewCell
        
        if iconFlag[indexPath.row] == 0 {
            myCell.ThumbImage.image = #imageLiteral(resourceName: "OrangeFace")
        }
        else if iconFlag[indexPath.row] == 1 {
            myCell.ThumbImage.image = #imageLiteral(resourceName: "RedFace")
        }
        else if iconFlag[indexPath.row] == 2 {
            myCell.ThumbImage.image = #imageLiteral(resourceName: "GreenFace")
        }
        
        myCell.groupName!.text = StudyList[indexPath.row]
        myCell.Count!.text = StudyPeople[indexPath.row]
        myCell.limitCount!.text = StudyLimit[indexPath.row]
        
        return myCell
    }
    
    
}

