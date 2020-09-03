//
//  ViewController.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 01/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let userData = User()
    
    @IBAction func signinButtonClick(_ sender: Any) {
        self.geDataFromView()
        if (userData.isValid()){
            Auth.auth().createUser(withEmail: userData.Email, password: userData.Password){
                (user,error) in
                if error == nil{
                    self.cleanView()
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)

                }else{
                    print(error?.localizedDescription.description as Any)
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController,animated: true,completion: nil)
                    
                }
            }
            
            print("signin")
        }
        
    }
    
    @IBAction func loginButtonClick(_ sender: Any) {
        print("login")
        self.geDataFromView()
        if (userData.isValid()){
            Auth.auth().signIn(withEmail: userData.Email, password: userData.Password){
                (user,error) in
                if error == nil{
                    self.cleanView()
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)

                }else{
                    print(error?.localizedDescription.description as Any)
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController,animated: true,completion: nil)
                    
                }
            }
        }
        
    }
    func geDataFromView(){
        let email: String = emailTextField.text ?? ""
        let pass: String = passwordTextField.text ?? ""
        if email != "" || pass != ""{
            userData.Email = email
            userData.Password = pass
            
        }else{
            let alertController = UIAlertController(title: "Error", message: "Missing Data (Email or Password)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController,animated: true,completion: nil)
        }
    }
    func cleanView(){
        emailTextField.text =  ""
        passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login/Signin"
        signinButton.backgroundColor = UIColor.black
        signinButton.setTitleColor(UIColor.white, for: .normal)
        signinButton.layer.cornerRadius = 10
        signinButton.clipsToBounds = true
        
        loginButton.backgroundColor = UIColor.black
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
}

