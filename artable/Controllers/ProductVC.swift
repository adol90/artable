//
//  ProductVC.swift
//  artable
//
//  Created by Adel Kazme on 27/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase

class ProductVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var products = [Product]()
    var selectedCategory : Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
//        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productCell")
        
        
        let aproduct = Product.init(name: "car", id: "efwwe", category: "vehicle", price: 9.99, productDescription: "this is our newest car version", imageUrl: "https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80", timeStamp: Timestamp(), stock: 10, favorite: true)
        
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        products.append(aproduct)
        
    }
    

}




extension ProductVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell {
            cell.configureCell(product: products[indexPath.row])
            
            return cell
        }
            return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    
}
