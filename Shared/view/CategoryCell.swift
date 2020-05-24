//
//  CategoryCell.swift
//  artable
//
//  Created by Adel Kazme on 27/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.cornerRadius = 6
    }
    
    
    
    func configureCell(category : Category) {
        
        categoryLabel.text = category.name
        if let url = URL(string: category.imgUrl){
        let placeholder = UIImage(named: "placeholder")
            let options : KingfisherOptionsInfo = [.transition(.fade(0.3))]
        categoryImg.kf.setImage(with: url , placeholder: placeholder , options: options ) }
        
    }
    

}
