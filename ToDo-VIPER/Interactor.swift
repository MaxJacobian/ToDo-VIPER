//
//  Interactor.swift
//  ToDo-VIPER
//
//  Created by Maksym on 09.03.2021.
//

import Foundation
import RealmSwift



protocol InteractorInput {
    func add(target: [Target])
    func loadedTargets()->[Target]
    func removeTarget(idRemove: Int)
   
}
protocol InteractorOutput {

}
class Interactor: InteractorInput {

       
        var storage: [Target] = []
        let relam = try! Realm()
      
    
        func add(target: [Target]){
            for element in target {
                try! relam.write(){
                    relam.add(element)
                }
            }
        }
    
        func loadedTargets()->[Target]{
            for target in relam.objects(Target.self){
                if !target.task.isEmpty{
                    storage.append(target)
                }
            }
            return storage
           
        }
    
        func removeTarget(idRemove: Int){
            let targets = relam.objects(Target.self)
            for target in targets {
                if target.id == idRemove {
                    try! relam.write(){
                        relam.delete(target)
                    }
                }
            }
        }
}
