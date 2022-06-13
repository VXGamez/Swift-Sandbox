//
//  TaskListCellTableViewCell.swift
//  Notify
//
//  Created by Martí Ejarque Galindo on 22/10/21.
//

import UIKit

class TaskListCellTableViewCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void

   
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var doneButtonAction : DoneButtonAction?
    
    @IBAction func actionButton(_ sender: Any) {
        doneButtonAction?()
    }
}
