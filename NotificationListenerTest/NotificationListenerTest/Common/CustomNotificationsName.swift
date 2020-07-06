
//File Definition:
// Added custom enum named "Notifications" to add custom notification name we need.

import UIKit

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
