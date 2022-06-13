//
//  MyTask.swift
//  Notify
//
//  Created by Victor Xirau on 15/10/21.
//

import UIKit


class MyTask: UITableViewController {
    
    var tasks: [[Task]] = []
    var allowed: Bool = false
    static let taskListCellIndentifier = "TaskListCellTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = UNUserNotificationCenter.current()

            center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                if granted {
                    self.allowed = true
                } else {
                    self.allowed = false
                }
            }
        let defaults = UserDefaults.standard
        let string = defaults.object(forKey: "persistantTask") as? String ?? ""
        if !string.isEmpty {
            do {
                let jsonDecoder = JSONDecoder()
                let jsonData = string.data(using: .utf8)
                let jsonTasks = try jsonDecoder.decode(JSONTask.self, from:jsonData!)
                self.tasks = jsonTasks.tasks
            } catch {
                print("ERROR 1")
            }
        }
        self.tableView.reloadData()
        
    }
   
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tasks[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            let jsonEncoder = JSONEncoder()
            do {
                let jsonTasks =  JSONTask(tasks: self.tasks)
                let defaults = UserDefaults.standard
                let jsonData = try jsonEncoder.encode(jsonTasks)
                let json = String(data:jsonData,encoding: String.Encoding.utf8)
                defaults.set(json,forKey: "persistantTask")
                defaults.synchronize()
                
            } catch {
                print("ERROR")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.taskListCellIndentifier, for: indexPath) as?
                TaskListCellTableViewCell else {
            fatalError("error")
        }
        let task = tasks[indexPath.section][indexPath.row]
        let image = task.isComplete ? UIImage(systemName: "checkmark.circle.fill"): UIImage(systemName: "checkmark.circle")
        cell.titleLabel.text = task.title
        cell.dateLabel.text = task.dueDate.getFormattedDate(format: "dd-MM-yyyy HH:mm:ss")
        cell.button.setBackgroundImage(image, for: .normal)
        cell.doneButtonAction = {
            self.tasks[indexPath.section][indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "idAdd" {
            let vc = (segue.destination as! UINavigationController).viewControllers[0] as! AddScreenViewController
            vc.saveTask = {
                
                
                newTask in
                
                if self.allowed {
                    
                        let center = UNUserNotificationCenter.current()

                        let content = UNMutableNotificationContent()
                        content.title = newTask.title
                        content.body = "Hey! You have a pending reminder"
                        content.sound = UNNotificationSound.default
                        content.categoryIdentifier = "yourIdentifier"
                        content.userInfo = ["example": "information"] // You can retrieve this when displaying notification

                        
                        // Setup trigger time
                        var calendar = Calendar.current
                        calendar.timeZone = TimeZone.current
                
                        let testDate = calendar.date(byAdding: .minute, value: -1, to: newTask.dueDate) // Set this to whatever date you need
                    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: testDate!)
                        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                    
                        // Create request
                        let uniqueID = UUID().uuidString // Keep a record of this if necessary
                        let request = UNNotificationRequest(identifier: uniqueID, content: content, trigger: trigger)
                        center.add(request) // Add the notification request
                    
                    
                }
                
                if self.tasks.isEmpty {
                    self.tasks.append([])
                }
                
                self.tasks[0].append(newTask)
                let jsonEncoder = JSONEncoder()
                
                do {
                    let jsonTasks =  JSONTask(tasks: self.tasks)
                    let defaults = UserDefaults.standard
                    let jsonData = try jsonEncoder.encode(jsonTasks)
                    let json = String(data:jsonData,encoding: String.Encoding.utf8)
                    defaults.set(json,forKey: "persistantTask")
                    defaults.synchronize()
                    
                } catch {
                    print("ERROR")
                }
                
               
                self.tableView.reloadData()
            }

        }
    
    }
   

}
