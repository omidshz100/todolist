//
//  ProvileViewViewModel.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 24/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



class ProfileViewViewModel:ObservableObject{
    @Published var user:User? = nil
    
    init(){
        
    }
    
    func FetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId).getDocument { [weak self] snapShot, error in
                
                guard let data = snapShot?.data() , error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(id: data["data"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
