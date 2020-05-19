//
//  ForgetPasswordVC.swift
//  artable
//
//  Created by Adel Kazme on 27/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase

class ForgetPasswordVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        var auth = Auth.auth()
        var emailAddress = emailText.text!
        
//        auth.sendPasswordResetEmail(emailAddress).then(function() {
//          // Email sent.
//        }).catch(function(error) {
//          // An error happened.
//        })
        auth.sendPasswordReset(withEmail: emailAddress) { (error) in
            if error != nil {
                self.handleFireAuthError(error: error!) } else {
                self.simpleAlert(title: "رائع", msg: "تم ارسال رسالة اعادة التعيين لإيميلك بنجاح")

            }
        }
        
    }
    
    
}
