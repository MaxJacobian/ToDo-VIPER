//
//  ToDoViewController.swift
//  ToDo-VIPER
//
//  Created by Maksym on 10.03.2021.
//

import UIKit

class ToDoViewController: UITableViewController, PressenterOutput {
    
    
    var target: [Target] = []
    
    var presenterInput: PressenterInput = Pressenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenterInput.output = self
        presenterInput.start(tableView: tableView)
    }
    
    @IBAction func add(_ sender: Any) {
       present( presenterInput.add(tableView: tableView), animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterInput.output.target.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Target", for: indexPath)
        cell.textLabel?.text = presenterInput.output.target[indexPath.row].task
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: false)
        presenterInput.removeTarget(idRemove: presenterInput.output.target[indexPath.row].id, tableView: tableView, index: indexPath.row)
       }
   
}
