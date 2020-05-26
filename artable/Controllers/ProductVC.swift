//
//  ProductVC.swift
//  artable
//
//  Created by Adel Kazme on 27/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase


class ProductVC: UIViewController   {
    @IBOutlet weak var tableView: UITableView!
    var products = [Product]()
    var selectedCategory : Category!
    var db : Firestore!
    var listener : ListenerRegistration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productCell")
//
//
//        let aproduct = Product.init(name: "car", id: "efwwe", category: "vehicle", price: 9.99, productDescription: "this is our newest car version", imageUrl: "https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80", timeStamp: Timestamp(), stock: 10, favorite: true)
//
//        products.append(aproduct)

    }
    



//
//func setupQuery() {
//    guard let selectedCategory = selectedCategory else { return }
//    listener = Firestore.firestore().collection("products").whereField("categoryId", isEqualTo: selectedCategory.id).order(by: "name", descending: false).addSnapshotListener { (snapshot, error) in
//        if let error = error {
//            print("error")
//            debugPrint(error.localizedDescription)
//        }
//        snapshot?.documentChanges.forEach({ (change) in
//            let data = change.document.data()
//            var product: Product
//            do {
//                product = try FirestoreDecoder().decode(Product.self, from: data)
//            } catch {
//                debugPrint(error)
//                return
//            }
//            switch change.type {
//            case .added:
//                self.onDocumentAdded(change: change, product: product)
//            case .modified:
//                self.onDocumentModified(change: change, product: product)
//            case .removed:
//                self.onDocumentRemoved(change: change)
//            }
//        })
//    }
//}



}


extension ProductVC : UITableViewDelegate , UITableViewDataSource {
    
//    func onDocumentAdded(change: DocumentChange, product: Product) {
//        let newIndex = Int(change.newIndex)
//        products.insert(product, at: newIndex)
//        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .fade)
//    }
//    
//    func onDocumentModified(change: DocumentChange, product: Product) {
//        if change.oldIndex == change.newIndex {
//            // Item changed but remained in the same position
//            let index = Int(change.oldIndex)
//            products[index] = product
//            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
//        } else {
//            // Item changed and changed position
//            products.remove(at: Int(change.oldIndex))
//            products.insert(product, at: Int(change.newIndex))
//            tableView.moveRow(at: IndexPath(row: Int(change.oldIndex), section: 0), to: IndexPath(row: Int(change.newIndex), section: 0))
//            tableView.reloadRows(at: [IndexPath(row: Int(change.newIndex), section: 0), IndexPath(row: Int(change.oldIndex), section: 0)], with: .automatic)
//        }
//    }
//    
//    func onDocumentRemoved(change: DocumentChange) {
//        products.remove(at: Int(change.oldIndex))
//        tableView.deleteRows(at: [IndexPath(row: Int(change.oldIndex), section: 0)], with: .left)
//    }
//    
    
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = detailsVC()
        let selectedProduct = products[indexPath.row]
        vc.theProduct = products[indexPath.row]
        print(selectedProduct)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        // present it ! :
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180
    }
    
    
}
