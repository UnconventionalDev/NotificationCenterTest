// File definition: Sample class for shared instance with some methods.

import  UIKit

class NotificationKeyboard {
    static let shared = NotificationKeyboard()
    
    func keyboardWillAppear() {
        print("Shared keyboardWillAppear is called")
    }
    
    func keyboardDidAppear() {
        print("Shared keyboardDidAppear is called")
    }
    
    func keyboardWillHide() {
        print("Shared keyboardWillHide is called")
    }
    
    func keyboardDidHide() {
        print("Shared keyboardDidHide is called")
    }
    
    static func payMoney() {
        print("your might be paying money for wrong instance")
    }
    
    class func updateMedicine() {
        print("Might be updating drug for wrong patient.")
    }
}


