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
    

    @IBAction func forgotUserNameTapped(_ sender: UIButton) {
        let forgotUserNameAC = UIAlertController(title: "Forgot User Name", message: "Your User Name is pavel", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        forgotUserNameAC.addAction(ok)
        present(forgotUserNameAC, animated: true)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        let forgotPasswordAC = UIAlertController(title: "Forgot Password", message: "Your Password is 123", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        forgotPasswordAC.addAction(ok)
        present(forgotPasswordAC, animated: true)
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let wrongDataAlert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        let emptyFieldAlert = UIAlertController(title: "Ошибка", message: "Введите логин и пароль", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        emptyFieldAlert.addAction(ok)
        wrongDataAlert.addAction(ok)
        
        if (userNameTF.text?.isEmpty == false) && (passwordTF.text?.isEmpty == false)  {
            if (userNameTF.text == "pavel") && (passwordTF.text == "123")
            {
                performSegue(withIdentifier: "signinSegue", sender: nil)
            } else {
                present(wrongDataAlert, animated: true)
            }
        } else {
            present(emptyFieldAlert, animated: true)
        }
    }
    //close keyboard on tap at free space
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

