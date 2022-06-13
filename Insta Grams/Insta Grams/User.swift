//
//  User.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 5/11/21.
//

import UIKit

struct User{
    var username: String?
    var name: String?
    var profileImage: UIImage?
    var numFollowers: Int
    var numFollowing: Int
    var numPosts: Int
    var descripcio: String?
    var posts: [Post]?
    
    static func getMyUser() -> User{
        let user1 = User(username: "Prova1", name: "prova uno", profileImage: UIImage(named: "id1"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" , posts: Post.fetchPosts())
        return user1
        
    }
}
