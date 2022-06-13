//
//  PostView.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 5/11/21.
//

import UIKit

class PostView: UITableViewCell {
    
    typealias DetailButton = () -> Void
    
    @IBOutlet weak var likeImage: UIButton!
    @IBOutlet var post: UIImageView!
    @IBOutlet var imagen: UIImageView!
    @IBOutlet weak var name: UIButton!
    @IBOutlet weak var likes: UIButton!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var bioPost: UILabel!
    @IBOutlet weak var save: UIButton!
    var detailButton : DetailButton?
    var commentButton : DetailButton?
    var saveButton : DetailButton?
    var likeButton : DetailButton?
    
    @IBOutlet weak var width: NSLayoutConstraint!
  
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraints: width)

    
    var posts: Post!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        
        imagen.layer.cornerRadius = imagen.bounds.width / 2.0
        imagen.layer.masksToBounds = true
        
        imagen.image = posts.createdBy.profileImage
        
        post.image = posts.image
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dT))
        gesture.delegate = self
        gesture.numberOfTapsRequired = 2
        post.addGestureRecognizer(gesture)
        name.setTitle(posts.createdBy.username, for: .normal)
        
        likes.setTitle("\(posts.numberofLikes ?? 0) likes" , for: .normal)
        
        timestamp.text = posts.timeAgo
        
        bioPost.text = posts.caption
        
        let image = posts.liked! ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        likeImage.setImage(image, for: .normal)
        
        let image2 = posts.saved! ? UIImage(systemName: "bookmark") : UIImage(systemName: "bookmark.fill")
        
        save.setImage(image2, for: .normal)
        
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func viewDetail(_ sender: Any) {
        detailButton?()
    }
    
    @IBAction func comment(_ sender: Any) {
        commentButton?()
    }
    
    @IBAction func save(_ sender: Any) {
        saveButton?()
    }
    
    @IBAction func like(_ sender: Any) {
        
        self.likeButton?()
        
        
    }
    
    @IBAction func dT(_ sender: Any) {
        
        likeAnimator.animate{
            self.likeButton?()
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
