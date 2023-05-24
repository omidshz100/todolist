//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI
import FirebaseFirestoreSwift


struct TodoListView: View {
    @StateObject var viewModel:ToDoListViewViewModel = ToDoListViewViewModel()
    @FirestoreQuery var items:[ToDoListItem]
    
    init(userID:String) {
        // user <id>/todo/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todo")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            // Delete action
                            Button{
                                viewModel.delete(id: item.id)
                            }label: {
                                Text("Delete")
                                    .background(Color.red)
                            }
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
