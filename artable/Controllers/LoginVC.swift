//
//  ViewController.swift
//  artable
//
//  Created by Adel Kazme on 24/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        
        
        let xibVC = ForgetPasswordVC()
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //عشان نخلي الفيوكنترولر الستايل حقه يظهر بشكل كامل مختفي ل ظهر واذا الغيناه يتدرج اختفاءه لين يختفي  حركة حلوه تغيير عن الشو الي يظهر من تحت لفوق ويتخفي من فوق لتحت .
        xibVC.modalTransitionStyle = .crossDissolve
        xibVC.modalPresentationStyle = .overCurrentContext
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        present(xibVC, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        
        if emailText.text?.count == 0 || passwordTxt.text?.count == 0 {
            simpleAlert(title: "خطأ", msg: "الرجاء تعبئة كل الخانات")
            return}
        
        Auth.auth().signIn(withEmail: emailText.text! , password: passwordTxt.text!) { (AuthDataResult, error) in
            
            if error != nil {
                print("error while signing in")
                self.handleFireAuthError(error: error!)
            } else {
                
                print("signed in successfully")
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "toHomeVC", sender: self)
                
                
            }
        }
        
        
    }
    
    @IBAction func guestButtonPressed(_ sender: Any) {
        
//        
//        Auth.auth().signInAnonymously { (result, error) in
//            if error != nil {
//                self.handleFireAuthError(error: error!)
//            } else {
//            print("signed in anonymously from logVC")
               performSegue(withIdentifier: "toHomeVC", sender: self)
//        }
//        }
    }
    

}

