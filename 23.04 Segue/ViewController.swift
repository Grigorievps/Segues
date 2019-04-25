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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    //close keyboard on tap at free space
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

