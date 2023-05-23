//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import Foundation
import FirebaseAuth


class MainViewViewModel:ObservableObject {
    @Published var currentUserId:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _ , user1 in
            DispatchQueue.main.async {
                self?.currentUserId =  user1?.uid ?? ""
            }
        }
    }
    
    public var isSignedId: Bool {
        return Auth.auth().currentUser != nil
    }
}
