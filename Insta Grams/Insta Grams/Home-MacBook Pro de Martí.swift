//
//  Home.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 5/11/21.
//

import UIKit
import YPImagePicker



class Home: UITableViewController {
    
    var posts: [[Post]] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        
        self.fetchPosts()
        self.tableView.rowHeight = 650

        // Do any additional setup after loading the view.
    }
    
    func fetchPosts(){
        posts = Singleton.shared.feed
        tableView.reloadData()
        print("Fetch")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return posts.count
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchPosts()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postID", for:indexPath) as! PostView
        
        
        cell.posts = posts[indexPath.section][indexPath.row]
        cell.selectionStyle = .none
        cell.detailButton = {
            
            let sb = UIStoryboard(name:"Main", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "detailID") as! DetailViewController
            vc.user = self.posts[indexPath.section][indexPath.row].createdBy
           
        
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.commentButton = {
            
            let alert = UIAlertController(title: "Comments", message: "Comments disabled", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
            
        }
        
        cell.likeButton = { [self] in
            self.posts[indexPath.section][indexPath.row].liked = !(self.posts[indexPath.section][indexPath.row].liked ?? true)
            
            if( self.posts[indexPath.section][indexPath.row].liked!){
                
                self.posts[indexPath.section][indexPath.row].numberofLikes! += 1
                
            } else {
                
                self.posts[indexPath.section][indexPath.row].numberofLikes! -= 1
                
            }
            
           
            tableView.reloadData()
        }
        
        cell.saveButton = {
            self.posts[indexPath.section][indexPath.row].saved = !(self.posts[indexPath.section][indexPath.row].saved ?? true)
            
            var alert: UIAlertController
            
            if(!self.posts[indexPath.section][indexPath.row].saved!){
                alert = UIAlertController(title: "Save", message: "Post saved!", preferredStyle: UIAlertController.Style.alert)
            } else {
                alert = UIAlertController(title: "Unsave", message: "Post unsaved!", preferredStyle: UIAlertController.Style.alert)
            }
            
        
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
            tableView.reloadData()
        }
        
        cell.sendButton = {
            let alert = UIAlertController(title: "Send", message: "Send disabled", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        
        return cell
    }
    
    
    @IBAction func addNewPost(_ sender: Any) {
        /*var config = YPImagePickerConfiguration()
        config.isScrollToChangeModesEnabled = true
        config.onlySquareImagesFromCamera = true
        config.usesFrontCamera = false
        config.showsPhotoFilters = true
        config.showsVideoTrimmer = true
        config.startOnScreen = YPPickerScreen.photo
        config.screens = [.library, .photo]
        config.showsCrop = .rectangle(ratio: 1)
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.hidesCancelButton = false
        config.library.mediaType = YPlibraryMediaType.photo
        config.library.defaultMultipleSelection = false
        config.library.spacingBetweenItems = 1.0
        config.wordings.libraryTitle = "Galeria"
        config.wordings.cameraTitle = "Camara"
        config.wordings.next = "OK"
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                let user5 = User(username: "Prova5", name: "prova cinco", profileImage: UIImage(named: "id4"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" )
                let newPost =  Post(createdBy: user5, timeAgo: "1 hour", caption: "Aixo es o no es", image: photo.image, numberofLikes: 69,liked: false, saved: false)
                
                var postArray: [Post] = []
                postArray.append(newPost)
                
                
                
                self.posts.insert(postArray, at: 0)
                
                self.tableView.reloadData()
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
     */
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
                
                let newPost =  Post(createdBy: Singleton.shared.myUser, timeAgo: "1 hour", caption: "Aixo es o no es", image: photo.image, numberofLikes: 69,liked: false, saved: false)
                
                self.posts[0].insert(newPost, at: 0)
                
                Singleton.shared.myUser.posts?.insert(newPost, at: 0)
                
                Singleton.shared.feed[0].insert(newPost, at: 0)
                
                self.tableView.reloadData()
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
}




