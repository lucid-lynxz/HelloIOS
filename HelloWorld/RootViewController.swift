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
    
    // 类似于loading框
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 注册键盘广播监听
        // 别忘了在合适的时候注销监听
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardDidShow(_:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: Notification.Name.UIKeyboardDidHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 注销键盘广播监听
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardDidHide, object: nil)
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
    
    // 点击 upload 按钮后回调
    @IBAction func startUpload(_ sender: UIButton) {
        if activityIndicatorView.isAnimating {
            activityIndicatorView.stopAnimating()
            sender.setTitle("重新开始", for: UIControlState.normal)
        }else{
            activityIndicatorView.startAnimating()
            sender.setTitle("停止", for: UIControlState.normal)
        }
    }
    
    var timer:Timer!
    var btnDownload:UIButton?
    @IBAction func startDownload(_ sender: UIButton) {
        sender.isEnabled = false
        btnDownload = sender
        self.progressView.progress = 0
        self.timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(download), userInfo: nil, repeats: true)
    }
    
    @objc func download(){
        self.progressView.progress += 0.1
        if (self.progressView.progress == 1.0) {
            self.timer.invalidate()
            
            let alertController = UIAlertController(title: "download complete", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            btnDownload?.isEnabled = true
        }
        
    }
    
    // 用户在textField控件上按下return时回调
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(TAG,"TextField获得焦点,用户点击了return键")
        // 隐藏键盘
        // 需要放弃 firstResponder
        // 键盘隐藏后, iOS系统发发出广播
        textField.resignFirstResponder()
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
    
    @objc  func keyboardDidShow(_ notification:Notification){
        print("键盘打开了")
    }
    
    @objc func keyboardDidHide(_ notification:Notification){
        print("键盘关闭了")
    }
    
    
    @IBAction func switchValueChange(_ sender: UISwitch) {
        print(TAG,"switch state: ",sender.isOn)
    }
    // 显示alertView
    @IBAction func showAlertDialog(_ sender: Any) {
        let alertController:UIAlertController = UIAlertController(title: "友情提醒", message: "你该下班了", preferredStyle: UIAlertControllerStyle.alert)
        
        let noActijon = UIAlertAction(title: "不, 我还要写bug", style: UIAlertActionStyle.cancel, handler: {alertAction -> Void in  print("tab no button")
        })
        let yesAction = UIAlertAction(title: "好的, 这就闪人", style: .default, handler: {alertAction -> Void in print("tap yes button")})
        
        alertController.addAction(yesAction)
        alertController.addAction(noActijon)
        
        // 显示
        self.present(alertController,animated: true,completion: nil)
    }
    
}
