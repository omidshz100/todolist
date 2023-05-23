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
    @Published var errorMessage:String = "" 
    
    func login(){
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in the all fields .... "
            return
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return
        }
        print("Called")
    }
}
