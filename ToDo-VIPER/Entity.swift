//
//  Entity.swift
//  ToDo-VIPER
//
//  Created by Maksym on 10.03.2021.
//

import Foundation
import RealmSwift


class Target: Object {
    @objc dynamic var id = Int()
    @objc dynamic var task = String()
       static func setTarget(id: Int, task: String)->Target {
           let target = Target()
           target.id = id
           target.task = task
           return target
       }
}
