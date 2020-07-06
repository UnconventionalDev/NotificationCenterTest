// Note:
// This code is to explain the cause of not removing keyboard notification.
// Step 0: Once launchd the app, Tap "Observer Without Dismisser" button.
// Step 1: Add a keyboardDidAppear notification by tapping on "Add keyboardDidAppear observer with selector name" button
// Step 2: Add a keyboardWillAppear notification by tapping on "Add keyboardWillAppear observer wigh block" button.
// Step 3: Dismiss the view controller.
// Step 4: Now once again repeat the step 0, step 1, step 2.
// Step 5: Select the text field. Once keyboard appeared. Please check the logs. "Shared keyboardWillAppear is called" is printed twice. The previous instances didnt get clear.

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var willAppearCountLabel: UILabel!
    @IBOutlet weak var didAppearCountLabel: UILabel!
    @IBOutlet weak var testTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppearCountLabel.text = ""
        didAppearCountLabel.text = ""
    }

    @IBAction func didTapAddObserverWithSelector(_ sender: Any) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidAppeared),name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @IBAction func didTapAddObserverWithBlock(_ sender: Any) {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] _ in
            self?.keyboardWillAppear()
            NotificationKeyboard.shared.keyboardWillAppear()
            NotificationKeyboard.payMoney()
            NotificationKeyboard.updateMedicine()
        }
    }
    
    @objc func keyboardDidAppeared() {
        var count = Int(didAppearCountLabel.text ?? "0") ?? 0
        count += 1
        didAppearCountLabel.text = String(count)
    }
    
    func keyboardWillAppear() {
        var count = Int(willAppearCountLabel.text ?? "0") ?? 0
        count += 1
        willAppearCountLabel.text = String(count)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        willAppearCountLabel.text = ""
        didAppearCountLabel.text = ""
    }
}


