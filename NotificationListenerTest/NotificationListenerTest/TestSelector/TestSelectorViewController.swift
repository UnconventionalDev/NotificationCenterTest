//
//  TestSelectorViewController.swift
//  NotificationListenerTest
//
//  Created by Sujananth Visvaratnam on 30/06/20.
//  Copyright © 2020 Sujananth Visvaratnam. All rights reserved.
//

import UIKit

//class TestSelectorViewController: TestSelectorBaseClass {
//
//    @objc func keyboardWillShow() {
//        print("Protocl - Keyboard will show notification")
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addGestureRecognizer(self.endEditingRecognizer())
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidAppeared),name: UIResponder.keyboardDidShowNotification, object: nil)
//    }
//
//    private func endEditingRecognizer() -> UIGestureRecognizer {
//        let tapRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
//        tapRecognizer.cancelsTouchesInView = false
//        return tapRecognizer
//    }
//
//    @objc override func keyboardDidAppeared() {
//        print("Child Class Class - Keybord Did Appeared")
//    }
//
//}

//extension TestSelectorViewController: TestSelectorProtocol {
//
//}


//class TestSelectorBaseClass: UIViewController {
//    @objc func keyboardDidAppeared() {
//        print("Base Class - Keybord Did Appeared")
//    }
//}

//@objc public protocol TestSelectorProtocol: class {
//    func addKeyboardWillShowNotification()
//    func keyboardWillShow()
//}
//
//extension TestSelectorProtocol where Self: UIViewController {
//    @objc func addKeyboardWillShowNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),name: UIResponder.keyboardDidShowNotification, object: nil)
//    }
//}


//@objc public protocol TestSelectorProtocol: TestSelectorParentProtocol {
//    func addKeyboardWillShowNotification()
//    func keyboardWillShow()
//}
//
//extension TestSelectorProtocol where Self: TestSelectorViewController  {
//
//    func addKeyboardWillShowNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),name: UIResponder.keyboardDidShowNotification, object: nil)
//    }
//}
//
//protocol TestSelectorChild:  TestSelectorProtocol {
//    func potato()
//}
//
//public protocol TestSelectorParentProtocol: class {
//    func tomato()
//}
