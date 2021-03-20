//
//  LoginViewController.swift
//  iprotechs_Task
//
//  Created by SANKAR on 19/03/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var rememberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if userNameTextField.text?.isEmpty == true && userNameTextField.text == "" || passwordTextField.text?.isEmpty == true && passwordTextField.text == "" {
            showAlertToUser(viewcontroller: self, message: "Please enter valid User Name OR Password")
            return
        }
        if rememberButton.tag == 1 {
            let userCredentials = ["userName":userNameTextField.text ?? "","password": passwordTextField.text ?? ""]
            Utilities.shared.saveUserDefault(userCredential: userCredentials, objectKey: userLoginKey)
        }
        let orderVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "OrderViewController") as? OrderViewController
        orderVC?.modalPresentationStyle = .fullScreen
        self.present(orderVC ?? UIViewController(), animated: true, completion: nil)
    }
    
    @IBAction func rememberButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.setImage(UIImage(named: "check"), for: .normal)
            sender.tag = 1
        }else{
            sender.tag = 0
            sender.setImage(UIImage(named: "un-Check"), for: .normal)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let registerVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
        registerVC?.modalPresentationStyle = .fullScreen
        self.present(registerVC ?? UIViewController(), animated: true, completion: nil)

    }
    
}
