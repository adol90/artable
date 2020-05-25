//
//  detailsVC.swift
//  artable
//
//  Created by Adel Kazme on 02/10/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Kingfisher

class detailsVC: UIViewController {


        // MARK :- Outlets :
        @IBOutlet weak var productDeatileImg: UIImageView!
        @IBOutlet weak var productLabel: UILabel!
        @IBOutlet weak var priceLabel: UILabel!
        @IBOutlet weak var productDescriptionLabel: UILabel!
        
        //ربطناه عشان اذا ضغطنا خارج الفيو يصير دسميس اذا م عندنا الي فيجوال ايفكت هذا كان خلينا الخلفية زر عشان يصير ديسميس اذا ضغطناه
        @IBOutlet weak var bgView: UIVisualEffectView!
        
        
        // تعريفات
        var theProduct : Product!
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            print(theProduct)

            productLabel.text = theProduct.name
            productDescriptionLabel.text = theProduct.productDescription
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            if let price = formatter.string(from: theProduct.price as NSNumber) { priceLabel.text = price }

            // KF image
            let url = URL(string: theProduct.imageUrl)
            productDeatileImg.kf.setImage(with: url)

            //add tap gesture to visual view to dissmiss the view when clicked :
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissProductDetails))
            tap.numberOfTapsRequired = 1
            bgView.addGestureRecognizer(tap)
        }
        
        @objc func dismissProductDetails () {
            
            dismiss(animated: true, completion: nil)
        }

        @IBAction func AddButtonPressed(_ sender: Any) {
            
            dismiss(animated: true, completion: nil)
        }
        
        @IBAction func KeepShoppingPressed(_ sender: Any) {
            
            dismiss(animated: true, completion: nil)
        }
        

}
