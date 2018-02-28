//
//  RootViewController.swift
//  HelloWorld
//
//  Created by Lynxz on 28/02/2018.
//  Copyright © 2018 lynxz. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var labelInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 设置按钮的点击事件
    var count = 1
    @IBAction func onClick(_ sender: UIButton) {
//        print("button onClick",sender)
        count+=1
        var info = "hello world \(count)"
        if count % 2 == 0 {
            info = "hello iOS \(count)"
        }
        self.labelInfo.text = info
    }
}
