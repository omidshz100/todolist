//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel:ObservableObject{
    
    
    @Published var showingNewItemView:Bool = false
    
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    
    
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todo")
            .document(id)
            .delete()
         
    }
}
