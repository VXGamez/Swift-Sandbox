//
//  AddScreenViewController.swift
//  Notify
//
//  Created by Martí Ejarque Galindo on 22/10/21.
//

import UIKit

class AddScreenViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var input: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTaskButtonActionHandler(_ sender: Any) {
        
        let t = Task(title: input.text!, dueDate: date.date)
        
        saveTask(t)
        dismiss(self)
    }
    var saveTask: (_ newTask:Task) -> Void = {arg in}
    
}
