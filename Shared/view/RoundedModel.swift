//
//  RoundedModel.swift
//  artable
//
//  Created by adol kazmy on 18/05/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import UIKit

class RoundedButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 6
    }
    
}


class RoundedShadowView: UIView {
      override func awakeFromNib() {
          super.awakeFromNib()
          layer.cornerRadius = 6
          layer.shadowColor = #colorLiteral(red: 0.01201203276, green: 0.07133468571, blue: 0.690414816, alpha: 1)
          layer.shadowOffset = CGSize.zero
          layer.shadowOpacity = 0.4
          layer.shadowRadius = 3 }
}


class RoundedImageView : UIImageView {
    override func awakeFromNib() {
          super.awakeFromNib()
          layer.cornerRadius = 6
      }
}

class RoundedView: UIView {
      override func awakeFromNib() {
          super.awakeFromNib()
          layer.cornerRadius = 6
}
}




