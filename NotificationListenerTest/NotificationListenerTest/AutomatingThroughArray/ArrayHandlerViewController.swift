
import UIKit


//This code is just another technique to register and unregister Notification Token automatically through viewWillAppear and viewWillDisappear.
// Please view logs to observe whats happening.

class ArrayHandlerViewController: ArrayHandlerBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRequiredObservers()
    }
    
    func addRequiredObservers() {
        let keyboardWillShowAutoNotificaion = AutoHandlingNotification(notificationName: UIResponder.keyboardWillShowNotification) { (_) in
            NotificationKeyboard.shared.keyboardWillAppear()
        }
        let keyboardDidShowAutoNotification = AutoHandlingNotification(notificationName: UIResponder.keyboardDidShowNotification) { (_) in
            NotificationKeyboard.shared.keyboardDidAppear()
        }
        let keyboardWillHideNotification = AutoHandlingNotification(notificationName: UIResponder.keyboardWillHideNotification) { (_) in
            NotificationKeyboard.shared.keyboardWillHide()
        }
        let keyboardDidHideNotification = AutoHandlingNotification(notificationName: UIResponder.keyboardDidHideNotification) { (_) in
            NotificationKeyboard.shared.keyboardDidHide()
        }
        self.notificationList = [keyboardWillShowAutoNotificaion, keyboardDidShowAutoNotification, keyboardWillHideNotification, keyboardDidHideNotification]
    }
}

//  A cutom class to store notification name and its handler. Also provide easy methods for register and unregister.
class AutoHandlingNotification {
    let notificationName: NSNotification.Name
    var handler: (Notification) -> ()
    var object: Any?
    var queue: OperationQueue?
    private var token: Any?
    
    init(notificationName: NSNotification.Name, completion:@escaping (Notification) -> Void) {
        self.notificationName = notificationName
        handler = completion
    }
    
    func register() {
        if (token == nil) {
            token = NotificationCenter.default.addObserver(forName: notificationName, object: object, queue: queue, using: handler)
        }
    }
    
    func unregister() {
        if let notificationToken = token {
            NotificationCenter.default.removeObserver(notificationToken)
        }
    }
}

// Base class for ArrayHandlingViewController where notification token registr and unregister happens automatically.

class ArrayHandlerBaseViewController: BaseViewController {
    var notificationList: [AutoHandlingNotification] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for notification in notificationList { notification.register() }
        NotificationCenter.default.post(name: Notifications.childViewPresented.name, object: nil, userInfo: ["kClassName": String(describing: self)])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for notification in notificationList { notification.unregister() }
    }
}
