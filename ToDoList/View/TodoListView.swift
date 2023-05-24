//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel:ToDoListViewViewModel = ToDoListViewViewModel()
    
    private var userId:String
    
    init(userID:String) {
        self.userId = userID
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do list")
            .toolbar{
                Button{
                    // action
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userID: "")
    }
}
