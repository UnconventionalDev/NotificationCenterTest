
//This scenario is to explain the issues in using  Default Notification Center while there is Parent Child Relationship.
// Step: 1, Once launched the application, tap "Understand Parent Child Behaviour"
// Step: 2, Tap "Present Child View Controller"

import UIKit

class ParentViewController: BaseViewController {

    @IBOutlet weak var presentChildButton: UIButton!
    @IBOutlet weak var testTextField: UITextField!
    @IBOutlet weak var textFieldTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: Notifications.childViewPresented.name, object: nil, userInfo: ["kClassName": String(describing: self)])
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] _ in
            self?.keyboardWillAppear()
        }
    } 
    
    func keyboardWillAppear() {
        self.presentChildButton.isHidden = true
        self.textFieldTopConstraint.constant = 20
    }
}

extension ParentViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textFieldTopConstraint.constant = 196
        self.presentChildButton.isHidden = false
    }
}
