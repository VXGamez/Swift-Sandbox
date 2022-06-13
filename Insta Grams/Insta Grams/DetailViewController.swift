//
//  Perfil.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 5/11/21.
//

import UIKit
import YPImagePicker

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var numPosts: UILabel!
    @IBOutlet weak var numFollowing: UILabel!
    @IBOutlet weak var numFollowers: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descripcio: UILabel!
    @IBOutlet weak var PerfilCollection: UICollectionView!
    var posts: [Post]? = []
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myUser = self.user!

        

        profilePicture.layer.cornerRadius = profilePicture.bounds.width / 2.0
        profilePicture.layer.masksToBounds = true
        profilePicture.image = myUser.profileImage
        
        numPosts.text = String(myUser.numPosts)
        numFollowing.text = String(myUser.numFollowing)
        numFollowers.text = String(myUser.numFollowers)
        name.text = myUser.name
        descripcio.text = myUser.descripcio
        posts = myUser.posts
        PerfilCollection.reloadData()
        
    }
    

    @IBAction func followed(_ sender: Any) {
        let alert = UIAlertController(title: "Debugging", message: "follow/unfollow", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func message(_ sender: Any) {
        let alert = UIAlertController(title: "Debugging", message: "mensaje directo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func options(_ sender: Any) {
        let alert = UIAlertController(title: "Debugging", message: "options", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*if section == 0 {
            return 0
        }*/
        return posts!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PerfilCollection.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
        cell.immage.image = posts![indexPath.row].image
        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        PerfilCollection.deselectItem(at: indexPath, animated: true)
        
        
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let marginsAndInsets = CGFloat(1) * 2 +  CGFloat(1) * CGFloat(3 - 1)
            let itemWidth = ((PerfilCollection.bounds.size.width - marginsAndInsets) / CGFloat(3)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
    
    
}
