//
//  Task.swift
//  Notify
//
//  Created by Victor Xirau on 15/10/21.
//

import UIKit

struct Task: Codable {
    var title: String
    var dueDate: Date
    var isComplete: Bool = false
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

    
    /*
extension Task {
    static var testData = [
        Task(title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0)),
        Task(title: "Code review", dueDate: Date().addingTimeInterval(14000.0), isComplete: true),
        Task(title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0)),
        Task(title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0), isComplete: true),
        Task(title: "Interview new project manager candidate", dueDate: Date().addingTimeInterval(60000.0)),
        Task(title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0)),
        Task(title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0)),
        Task(title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0)),
        Task(title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0))
    ]
}
     */
    

