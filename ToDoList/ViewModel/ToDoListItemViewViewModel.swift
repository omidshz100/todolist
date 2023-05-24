//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// todoList each item in TODoListView ( Each row )
class ToDoListItemViewViewModel:ObservableObject{
    init(){
        
    }
    
    
    func toggleIsDone(item:ToDoListItem){
        var newItem = item
        newItem.isDone = !item.isDone
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todo")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
