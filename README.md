最近有空,学点iOS的知识, 这个项目纯粹是 HelloWord 的demo


## 添加键盘显隐广播事件监听
```swift
// RootViewContrller.swift
override func viewDidLoad() {
    super.viewDidLoad()
    // 注册监听
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardDidShow(_:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
}
override func viewWillDisappear(_ animated: Bool) {
    // 注销监听
    NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardDidShow, object: nil)
}
// 方法前面需要添加 @objc
@objc  func keyboardDidShow(_ notification:Notification){
    print("键盘打开了")
}
```

## 显示alert提示框
```swift
// RootViewContoller.swift
// 添加某个button的 toup up inside 事件到本方法
@IBAction func showAlertDialog(_ sender: Any) {
    let alertController:UIAlertController = UIAlertController(title: "友情提醒", message: "你该下班了", preferredStyle: UIAlertControllerStyle.alert)
    
    // 否定按钮, 位于左边或者下边(按钮过长时,上下排列)
    let noActijon = UIAlertAction(title: "不, 我还要写bug", style: UIAlertActionStyle.cancel, handler: {alertAction -> Void in  print("tab no button")
    })
    // 肯定按钮, 位于右边或者上边
    let yesAction = UIAlertAction(title: "好的, 这就闪人", style: .default, handler: {alertAction -> Void in print("tap yes button")})

    alertController.addAction(yesAction)
    alertController.addAction(noActijon)

    // 显示
    self.present(alertController,animated: true,completion: nil)
}
```
