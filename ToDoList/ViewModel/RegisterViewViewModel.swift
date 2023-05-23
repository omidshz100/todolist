//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel:ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var fullname:String = ""
    
    init(){
        
    }
    
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            
            guard let userId = result?.user.uid else {
                return
            }
            
            self.insertUserRecord(id: userId)
        }
    
    }
    
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id,
                           name: fullname,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate()->Bool{
        guard !fullname.trimmingCharacters(in: .whitespaces).isEmpty,
         !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {
                  return false
              }
        
        guard email.contains("@"), email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        
        return true
    }
}
