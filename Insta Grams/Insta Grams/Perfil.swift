//
//  Perfil.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 5/11/21.
//

import UIKit
import YPImagePicker

class Perfil: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var numPosts: UILabel!
    @IBOutlet var numFollowing: UILabel!
    @IBOutlet var numFollowers: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var descripcio: UILabel!
    @IBOutlet weak var PerfilCollection: UICollectionView!
    var posts: [Post]? = []
    var user: User?
    var isMine: Bool! = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myUser = User.getMyUser();

        if !isMine {
            myUser = self.user!
        }
        
        
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
    

    @IBAction func sideMenu(_ sender: Any) {
        let alert = UIAlertController(title: "Debugging", message: "Estaries obrint menu lateral dret", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editProfile(_ sender: Any) {
        let alert = UIAlertController(title: "Debugging", message: "Estaries editant el perfil", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func discoverPeople(_ sender: Any) {
        let alert = UIAlertController(title: "Debugging", message: "Fuah una locura la de gent que et recomanem", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func addPostPerfil(_ sender: UIBarButtonItem) {
        var config = YPImagePickerConfiguration()
        config.isScrollToChangeModesEnabled = true
        config.onlySquareImagesFromCamera = true
        config.usesFrontCamera = false
        config.showsPhotoFilters = true
        config.showsVideoTrimmer = true
        config.startOnScreen = YPPickerScreen.photo
        config.screens = [.library, .photo]
        config.showsCrop = .rectangle(ratio: 3.0)
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.hidesCancelButton = false
        config.library.mediaType = YPlibraryMediaType.photo
        config.library.defaultMultipleSelection = false
        config.library.spacingBetweenItems = 1.0
        config.wordings.libraryTitle = "Galeria"
        config.wordings.cameraTitle = "Camara"
        config.wordings.next = "OK"
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                let user5 = User(username: "Prova5", name: "prova cinco", profileImage: UIImage(named: "id4"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" )
                let newPost =  Post(createdBy: user5, timeAgo: "1 hour", caption: "Aixo es o no es", image: photo.image, numberofLikes: 69,liked: false, saved: false)
                
                self.posts!.insert(newPost, at: 0)
                
                self.PerfilCollection.reloadData()
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
    /*func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }*/
    
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
