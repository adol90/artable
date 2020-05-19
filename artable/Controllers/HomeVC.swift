//
//  HomeVC.swift
//  artable
//
//  Created by adol kazmy on 18/05/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    @IBOutlet weak var logoutLabel: RoundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { (result, error) in
                print("signedIn Anonymously :o")
            } } else {
                print("")}

        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser , !user.isAnonymous {
            logoutLabel.setTitle("Logout", for: .normal)
        }
        else {logoutLabel.setTitle("Login", for: .normal)}
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        if let user = Auth.auth().currentUser , !user.isAnonymous{
        do {try Auth.auth().signOut()
            print("signedOut :) ")
//            navigationController?.popToRootViewController(animated: true)
performSegue(withIdentifier: "toLogin", sender: self)
            
        }
        catch {print("can't signout")
            self.handleFireAuthError(error: error)
            } } else {
//            navigationController?.popToRootViewController(animated: true)
    performSegue(withIdentifier: "toLogin", sender: self)
        }


    }
    

    


}
