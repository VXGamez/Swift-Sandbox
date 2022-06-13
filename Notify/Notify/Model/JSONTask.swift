//
//  JSONTask.swift
//  Notify
//
//  Created by Martí Ejarque Galindo on 22/10/21.
//

import Foundation

class JSONTask: Codable{
    var tasks: [[Task]]
    
    init(tasks: [[Task]]){
        self.tasks = tasks
    }
}
