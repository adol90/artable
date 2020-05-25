//
//  AdminHomeVC.swift
//  artableAdmin
//
//  Created by Adel Kazme on 02/10/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase

class AdminHomeVC: HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem?.isEnabled = false
        let addCategoryButton = UIBarButtonItem(title: "Add Category", style: .plain, target: self, action: #selector(addCategory))
        navigationItem.rightBarButtonItem = addCategoryButton
    }
    
    
    @objc func addCategory() {
        
    }

}
