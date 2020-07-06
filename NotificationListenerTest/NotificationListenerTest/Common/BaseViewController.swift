//File Definition:
// Base class for view controller. Added functionalty to end editing on tap gesture.


import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tapRecognizer.cancelsTouchesInView = false
        return tapRecognizer
    }
}
