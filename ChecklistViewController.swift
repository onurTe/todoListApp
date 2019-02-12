//
//  ViewController.swift
//  Checklist
//
//  Created by onur  on 29.01.2019.
//  Copyright © 2019 onur . All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var todolist: ToDoList
    
    required init?(coder aDecoder: NSCoder) {
        todolist = ToDoList()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath )
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = todolist.todos[indexPath.row].text
        }
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            configureCheckmark(for: cell, at: indexPath)
            tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath){
        let isChecked = todolist.todos[indexPath.row].checked
        
        
            if isChecked {
                cell.accessoryType = .none
            }else {
                cell.accessoryType = .checkmark
            }
        todolist.todos[indexPath.row].checked = !isChecked
        
}
}
