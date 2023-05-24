//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel:ObservableObject{
    @Published var title:String = ""
    @Published var dueDate:Date = Date()
    @Published var showAlert:Bool = false
    
    func save(){
        guard canSave else {
            return
        }
        
        // get user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // create model
        let newUUID = UUID().uuidString
        let newItem:ToDoListItem = ToDoListItem(id: newUUID,
                                                titel: title,
                                                dueDate: dueDate.timeIntervalSince1970,
                                                createdDate: Date().timeIntervalSince1970,
                                                isDone: false)
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todo")
            .document("123")
            .setData(newItem.asDictionary() )
    }
    
    var canSave:Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
       // there is a logic behind -86400, what ?
        // https://youtu.be/t_mypMqSXNw?t=6230
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
