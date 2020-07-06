
import UIKit
//Note: You could find many duplicate codes in thi sample. This is created just to play around without affecting other classes.
// This is just Landing View Controller to navigate.

class InitialViewController: UIViewController {

    var childViewAppearedNotification: Any?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if childViewAppearedNotification ==  nil {
            childViewAppearedNotification = NotificationCenter.default.addObserver(self, selector: #selector(didPresentChildView(notification:)), name: Notifications.childViewPresented.name, object: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let notificationToken = childViewAppearedNotification {
            NotificationCenter.default.removeObserver(notificationToken)
        }
    }
    
    @objc func didPresentChildView(notification: NSNotification) {
        if let className = notification.userInfo?["kClassName"] as? String {
            print("Child class name \(className) is presented now")
        }
    }
}

enum Notifications: String, NotificationName {
    case childViewPresented
}

protocol NotificationName {
    var name: Notification.Name { get }
}

extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        get {
            return Notification.Name(rawValue: self.rawValue) // We cannot do this in protocol extenison, so pulling it to raw representable.
        }
    }
}
