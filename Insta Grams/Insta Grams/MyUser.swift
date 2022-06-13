//
//  MyUser.swift
//  Insta Grams
//
//  Created by Martí Ejarque Galindo on 25/11/21.
//

import Foundation

class Singleton {

    /// The static field that controls the access to the singleton instance.
    var myUser: User
    var feed: [[Post]] = []
    /// This implementation let you extend the Singleton class while keeping
    /// just one instance of each subclass around.
    static var shared: Singleton = {
        let instance = Singleton()
        // ... configure the instance
        // ...
        return instance
    }()

    /// The Singleton's initializer should always be private to prevent direct
    /// construction calls with the `new` operator.
    private init() {
        self.myUser = User.getMyUser();
        self.feed.append(Post.fetchPosts()) 
    }

    /// Finally, any singleton should define some business logic, which can be
    /// executed on its instance.
    func someBusinessLogic() -> String {
        // ...
        return "Result of the 'someBusinessLogic' call"
    }
}
