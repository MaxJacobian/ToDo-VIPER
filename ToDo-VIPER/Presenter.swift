//
//  Presenter.swift
//  ToDo-VIPER
//
//  Created by Maksym on 09.03.2021.
//

import Foundation
import UIKit

protocol PressenterInput {
    func start(tableView: UITableView)
    var output: PressenterOutput! {get set}
    func add(tableView: UITableView)->UIAlertController
    func removeTarget(idRemove: Int, tableView: UITableView, index: Int)
    
}
protocol PressenterOutput {
    var target: [Target] {get set}
}
class Pressenter: PressenterInput, InteractorOutput{
    var target: [Target] = []
    var id = 0
    
    var interactorInput: InteractorInput = Interactor()
    var output: PressenterOutput!
    
    func start(tableView: UITableView){
        target = interactorInput.loadedTargets()
        output.target = target
        tableView.reloadData()
    }
    
    
    func add(tableView: UITableView)->UIAlertController {
        let alertController = UIAlertController(title: "New task", message: "Enter your task", preferredStyle: .alert)
                  let saveTask = UIAlertAction(title: "Save", style: .default) { [self]action in
                      let tf = alertController.textFields?.first
                      if let newTask = tf?.text {
                          target.append(Target.setTarget(id: id, task: newTask))
                          interactorInput.add(target: target)
                          output.target = target
                          id += 1
                          tableView.reloadData()
                      }
                  }
                  let cancelAction = UIAlertAction(title: "Cancel", style: .default){_ in}
                  alertController.addTextField{_ in}
                  alertController.addAction(saveTask)
                  alertController.addAction(cancelAction)
                  return alertController
    }
    func removeTarget(idRemove: Int, tableView: UITableView, index: Int) {
           target.remove(at: index)
           output.target = target
           interactorInput.removeTarget(idRemove: idRemove)
           tableView.reloadData()
    }
}

