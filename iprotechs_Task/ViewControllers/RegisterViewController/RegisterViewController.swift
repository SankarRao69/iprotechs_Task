//
//  RegisterViewController.swift
//  iprotechs_Task
//
//  Created by SANKAR on 19/03/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var signUPButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUPButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        
        if userNameTextField.text?.isEmpty == true && userNameTextField.text == "" || passwordTextField.text?.isEmpty == true && passwordTextField.text == "" || conformPasswordTextField.text?.isEmpty == true && conformPasswordTextField.text == "" {
            showAlertToUser(viewcontroller: self, message: userAlertMessageForFields)
            return
        }else if conformPasswordTextField.text != passwordTextField.text{
            showAlertToUser(viewcontroller: self, message: "Miss-matched Password")
            return
        }
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        loginVC?.modalPresentationStyle = .fullScreen
        self.present(loginVC ?? UIViewController(), animated: true, completion: nil)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIBarButtonItem) {
        Utilities.shared.removeAllUserDefaultsData()
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        loginVC?.modalPresentationStyle = .fullScreen
        self.present(loginVC ?? UIViewController(), animated: true, completion: nil)
    }
}
