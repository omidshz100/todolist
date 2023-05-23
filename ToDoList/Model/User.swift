//
//  User.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation


struct User:Codable{
    var id:String
    var name:String
    var email:String
    var joined: TimeInterval
}
