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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collictionView.delegate = self
        collictionView.dataSource = self
        collictionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        
        
        
        
        ////
//
//
//        let category = Category.init(name: "Apple Store", id: "nothing", imgUrl: "https://images.unsplash.com/photo-1514924356010-4be7d201d78b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80", isActive: true, timeStamp: Timestamp())
//
//
//        categories.append(category)
        
        
        ////
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
        let cellWidth = (width - 50) / 2
        let cellHight = cellWidth * 1.5
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductVC", sender: self)
    }
    
    
    
    
    
}
