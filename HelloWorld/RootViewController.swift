//
//  RootViewController.swift
//  HelloWorld
//
//  Created by Lynxz on 28/02/2018.
//  Copyright © 2018 lynxz. All rights reserved.
//

import UIKit

/*
 为了实现对 textView/textField 的监听,需要:
 1. 实现 UITextViewDelegate,UITextFieldDelegate;
 2. 重写方法
 3. 添加控件的代理设置
 */
class RootViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    let TAG = "RootViewController"

    // 通过 @IBOutlet 来关联xib布局中的控件
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
    var clickCount = 0
    @IBAction func onClick(_ sender: UIButton) {
        clickCount+=1
        // swift字符串通过 \(varName) 来插入变量,感觉有点繁琐啊
        var info = "hello world \(clickCount)"
        if clickCount % 2 == 0 {
            info = "hello iOS \(clickCount)"
        }
        labelInfo.text = info
    }
    
    // 用户在textField控件上按下return时回调
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(TAG,"TextField获得焦点,用户点击了return键")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print(TAG,"textFieldDidEndEditing")
    }
    
    // textView的事件
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            print(TAG,"textView获取焦点,用户按下了return键")
            return false
        }
        return true
    }
    
}
