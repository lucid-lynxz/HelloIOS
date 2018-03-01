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
