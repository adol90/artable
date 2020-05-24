//
//  Category.swift
//  artable
//
//  Created by Adel Kazme on 27/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import Firebase
import Foundation

struct Category {
    var name : String
    var id : String
    var imgUrl : String
    var isActive : Bool = true
    var timeStamp : Timestamp


init (data : [String : Any]) {
    
    self.name = data["name"] as? String ?? ""
    self.id = data["id"]  as? String ?? ""
    self.imgUrl = data["imgUrl"]  as? String ?? ""
    self.isActive = data["isActive"]  as? Bool ?? true
    self.timeStamp = data["timestamp"]  as? Timestamp ?? Timestamp()
}


}
