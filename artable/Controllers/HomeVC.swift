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
    @IBOutlet weak var collictionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var categories = [Category]()
    var category : Category!
    var db : Firestore!
    var listener : ListenerRegistration!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        collictionView.delegate = self
        collictionView.dataSource = self
        collictionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")

        
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
        else { logoutLabel.setTitle("Login", for: .normal)}
        
        setCategoryListener()
         print("listener function is ON")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        listener.remove()
        print("listener function is OFF")
    }

    

    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        if let user = Auth.auth().currentUser , !user.isAnonymous{
            do {try Auth.auth().signOut()
                print("signedOut :) ")
                //            navigationController?.popToRootViewController(animated: true)
                performSegue(withIdentifier: "toLogin", sender: self)
                
            }
            catch {print("can't signout")
                Auth.auth().handleFireAuthError(error: error , VC : self)
            } } else {
            //            navigationController?.popToRootViewController(animated: true)
            performSegue(withIdentifier: "toLogin", sender: self)
        }
        
        
    }
    
    
    // this is how we fetching data from firestore
    func setCategoryListener() {
        // this is the name of our colection in firestore database.
        let collectionRefernce = db.collection("categories")
        listener = collectionRefernce.addSnapshotListener { (snap, error) in
            if error != nil {
                debugPrint(error?.localizedDescription)
                return
            } else {
                snap?.documentChanges.forEach({ (change) in
                    let data = change.document.data()
                    let category  = Category.init(data: data)
                    switch change.type {
                    case .added :
                        self.onDocumentAdded(change: change, category: category)
                    case .modified :
                        self.onDocumentModified(change: change, category: category)
                    case .removed :
                        self.onDocumentRemoved(change: change)
                       
                    }
                })
            }
        }
        
    }
    
    
    func onDocumentAdded (change : DocumentChange , category : Category) {
        let index = Int(change.newIndex)
        categories.insert(category, at: index)
        collictionView.insertItems(at: [IndexPath(item: index, section: 0)])
        
    }
    
    func onDocumentModified (change : DocumentChange , category : Category) {
        
        if change.newIndex == change.oldIndex {
         let index = Int(change.newIndex)
            categories[index] = category
            collictionView.reloadItems(at: [IndexPath(item: index, section: 0)])
        } else {
            let oldIndex = Int(change.oldIndex)
            let newIndex = Int(change.newIndex)
            
            categories.remove(at: oldIndex)
            categories.insert(category, at: newIndex)
            collictionView.moveItem(at: IndexPath(item: oldIndex, section: 0), to: IndexPath(item: newIndex, section: 0))
        }
        
    }
    
    func onDocumentRemoved (change : DocumentChange) {
         let index = Int(change.newIndex)
        categories.remove(at: index)
        collictionView.deleteItems(at: [IndexPath(item: index, section: 0)])
        
    }
    


}


extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            
            cell.configureCell(category: categories[indexPath.item])
            
          return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let cellWidth = (width - 14) / 2
        let cellHight = cellWidth * 1.5
        
        return CGSize(width: cellWidth, height: cellHight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        category = categories[indexPath.item]
        performSegue(withIdentifier: "toProductVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ProductVC {
            destinationVC.selectedCategory = category
        }
    }
    
    
    
}
