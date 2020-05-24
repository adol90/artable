//
//  ProductCell.swift
//  artable
//
//  Created by Adel Kazme on 27/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImg: RoundedImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
    func configureCell(product : Product) {
        productLabel.text = product.name
        productPrice.text = String(product.price)
        if let url = URL(string: product.imageUrl){
        let placeholder = UIImage(named: "placeholder")
            let options : KingfisherOptionsInfo = [.transition(.fade(0.3))]
        productImg.kf.setImage(with: url , placeholder: placeholder , options: options ) }
  
        
    }
    
    
    @IBAction func favoritePressed(_ sender: Any) {
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
    
    
}
