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
}

class MyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var fab = Floaty()
    
    @IBOutlet weak var myTableView: UITableView!
    
    let StudyList:[String] = ["코딩 포모도로","토익 포모도로"]
    let StudyPeople:[String] = ["1","5"]
    let StudyLimit:[String] = ["1/10", "5/10"]
    
    //    @IBOutlet weak var BarIcon: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let subview = UIView()
        subview.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        subview.backgroundColor = .red
        view.addSubview(subview)
        subview.layer.cornerRadius = 50
        UIView.animate(withDuration: 0.5) {
            subview.frame.origin.y = 200
        }
        
    }
    
    func layoutFAB() {
        let item = FloatyItem()
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.title = "Custom item"
        item.handler = { item in }
        
        fab.fabDelegate = self as? FloatyDelegate
        
        self.view.addSubview(fab)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return StudyList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath) as! GroupTableViewCell

        myCell.groupName!.text = StudyList[indexPath.row]
        myCell.Count!.text = StudyPeople[indexPath.row]
        myCell.limitCount!.text = StudyLimit[indexPath.row]
        
        return myCell
    }
}

