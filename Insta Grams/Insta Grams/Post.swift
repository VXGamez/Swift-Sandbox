//
//  Post.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 5/11/21.
//

import UIKit

struct Post{
    var createdBy: User
    var timeAgo: String?
    var caption: String?
    var image: UIImage?
    var numberofLikes: Int?
    var liked: Bool?
    var saved: Bool?
    
    static func fetchPosts() -> [Post]{
        var posts = [Post]()
        
        let user1 = User(username: "Prova1", name: "prova uno", profileImage: UIImage(named: "id1"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams", posts: fetchPosts2())
        
        let user2 = User(username: "Prova2", name: "prova dos", profileImage: UIImage(named: "id2"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams", posts: fetchPosts2())
        
        let user3 = User(username: "Prova3", name: "prova tres", profileImage: UIImage(named: "id3"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams",posts: fetchPosts2())
        
        let user4 = User(username: "Prova4", name: "prova cuatro", profileImage: UIImage(named: "id4"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams",posts: fetchPosts2())
        
        let user5 = User(username: "Prova5", name: "prova cinco", profileImage: UIImage(named: "id4"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams",posts: fetchPosts2())
        
        let post1 = Post(createdBy: user1, timeAgo: "1 hour", caption: "Aixo es una prova", image: UIImage(named: "post1"), numberofLikes: 10, liked: true, saved: false)
        
        let post2 = Post(createdBy: user2, timeAgo: "2 hour", caption: "Aixo es una altra prova", image: UIImage(named: "post2"), numberofLikes: 56, liked: false, saved: false)
        
        let post3 = Post(createdBy: user3, timeAgo: "1 hour", caption: "Aixo no es res", image: UIImage(named: "post3"), numberofLikes: 32, liked: false, saved: false)
        
        let post4 = Post(createdBy: user4, timeAgo: "1 hour", caption: "Aixo potser es alguna cosa", image: UIImage(named: "post4"), numberofLikes: 69,liked: false, saved: false)
        
        let post5 = Post(createdBy: user5, timeAgo: "1 hour", caption: "Aixo es o no es", image: UIImage(named: "post1"), numberofLikes: 69,liked: false, saved: false)
        
        
        posts = [post1, post2, post3, post4, post5]
        
        /*posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)*/
        
        
        return posts
    }
    
    static func fetchPosts2() -> [Post]{
        var posts = [Post]()
        
        let user1 = User(username: "Prova1", name: "prova uno", profileImage: UIImage(named: "id1"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams")
        
        let user2 = User(username: "Prova2", name: "prova dos", profileImage: UIImage(named: "id2"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" )
        
        let user3 = User(username: "Prova3", name: "prova tres", profileImage: UIImage(named: "id3"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" )
        
        let user4 = User(username: "Prova4", name: "prova cuatro", profileImage: UIImage(named: "id4"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" )
        
        let user5 = User(username: "Prova5", name: "prova cinco", profileImage: UIImage(named: "id4"),numFollowers: 300, numFollowing: 25, numPosts: 15, descripcio: "Este es mi perfil de insta grams" )
        
        let post1 = Post(createdBy: user1, timeAgo: "1 hour", caption: "Aixo es una prova", image: UIImage(named: "post1"), numberofLikes: 10, liked: true, saved: false)
        
        let post2 = Post(createdBy: user2, timeAgo: "2 hour", caption: "Aixo es una altra prova", image: UIImage(named: "post2"), numberofLikes: 56, liked: false, saved: false)
        
        let post3 = Post(createdBy: user3, timeAgo: "1 hour", caption: "Aixo no es res", image: UIImage(named: "post3"), numberofLikes: 32, liked: false, saved: false)
        
        let post4 = Post(createdBy: user4, timeAgo: "1 hour", caption: "Aixo potser es alguna cosa", image: UIImage(named: "post4"), numberofLikes: 69,liked: false, saved: false)
        
        let post5 = Post(createdBy: user5, timeAgo: "1 hour", caption: "Aixo es o no es", image: UIImage(named: "post1"), numberofLikes: 69,liked: false, saved: false)
        
        
        posts = [post1, post2, post3, post4, post5]
        
        /*posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)*/
        
        
        return posts
    }
}

