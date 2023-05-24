//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
    let id:String
    let titel:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone:Bool
    
    mutating func setDone(_ state:Bool) {
        isDone = state
    }
}
