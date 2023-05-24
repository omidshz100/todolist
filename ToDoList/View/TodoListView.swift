//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI
import FirebaseFirestoreSwift


struct TodoListView: View {
    @StateObject var viewModel:ToDoListViewViewModel
    @FirestoreQuery var items:[ToDoListItem]
    
    init(userID:String) {
        // user <id>/todo/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todo")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userID))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            // Delete action
                            Button("Delet"){
                                viewModel.delete(id: item.id)
                            }.tint(Color.red )
                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do list")
            .toolbar{
                Button{
                    // action
                    viewModel.showingNewItemView.toggle()
                }label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userID: "lJEvv8QNTqNyotzmdNgcygdb8YI2")
    }
}
