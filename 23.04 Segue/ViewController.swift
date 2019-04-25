//
//  ViewController.swift
//  23.04 Segue
//
//  Created by Павел Григорьев on 23/04/2019.
//  Copyright © 2019 GP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signInButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Observers for keyboard
        func addKeyboardObservers() {
            let names: [NSNotification.Name] = [
                UIResponder.keyboardWillShowNotification,
                UIResponder.keyboardWillHideNotification
            ]
            
            for name in names {
                NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(keyboardWillResize),
                    name: name,
                    object: nil
                )
            }
        }
        
    }
    

    @IBAction func forgotUserNameTapped(_ sender: UIButton) {
    }
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
    }
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let wrongDataAlert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        let emptyFieldAlert = UIAlertController(title: "Ошибка", message: "Введите логин и пароль", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        emptyFieldAlert.addAction(ok)
        wrongDataAlert.addAction(ok)
        
        if (userNameTF.text?.isEmpty == false) && (passwordTF.text?.isEmpty == false)  {
            if (userNameTF.text == "123") && (passwordTF.text == "123")
            {
                print("Entry OK")
            } else {
                present(wrongDataAlert, animated: true)
            }
        } else {
            present(emptyFieldAlert, animated: true)
        }
    }

    
    @objc func keyboardWillResize(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] else { return }
        guard let keyboardFrameValue = keyboardFrame as? NSValue else { return }
        
        let keyboardSize = keyboardFrameValue.cgRectValue
        let constant: CGFloat
        
        if notification.name == UIResponder.keyboardWillShowNotification {
            if signInButtonConstraint.constant < keyboardSize.height {
                constant = keyboardSize.height
            }
                else {
            constant = signInButtonConstraint.constant
                
            }
        } else {
            constant = signInButtonConstraint.constant
        }
        
        signInButtonConstraint.constant = constant
    }
    //close keyboard on tap at free space
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

