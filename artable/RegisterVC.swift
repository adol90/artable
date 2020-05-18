//
//  ViewController.swift
//  artable
//
//  Created by Adel Kazme on 24/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passwordImg: UIImageView!
    @IBOutlet weak var confirmPasswordImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordImg.isHidden = true
        confirmPasswordImg.isHidden = true
        activityIndicator.isHidden = true
        
        passwordTxt.addTarget(self, action: #selector(textfieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textfieldDidChanged(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textfieldDidChanged(_ textfield : UITextField ) {
        
        passwordImg.isHidden = false
        confirmPasswordImg.isHidden = false
        
        if passwordTxt.text == confirmPasswordTxt.text {
            passwordImg.image = UIImage(named: "green_check")
            confirmPasswordImg.image = UIImage(named: "green_check")
        } else {
            passwordImg.image = UIImage(named: "red_check")
            confirmPasswordImg.image = UIImage(named: "red_check")
        }
        
        if passwordTxt.text?.count == 0 && confirmPasswordTxt.text?.count == 0 {
           passwordImg.isHidden = true
           confirmPasswordImg.isHidden = true }
        
    }
    
    
    @IBAction func registerPressed(_ sender: Any) {
        
        if passwordTxt.text?.count == 0 && confirmPasswordTxt.text?.count == 0 {return }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        
        Auth.auth().createUser(withEmail: usernametxt.text!, password: passwordTxt.text!) { (AuthDataResult, error) in
            

            if error != nil {
                
                print("couldnt create user \(error)")
            } else {
                print("user has been created successfully")
                self.activityIndicator.stopAnimating()
            }
        }
        
    }
    


}

