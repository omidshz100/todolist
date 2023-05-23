//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation


class LoginViewViewModel:ObservableObject {
    
    @Published var email:String = ""
    @Published var password:String = ""
}
