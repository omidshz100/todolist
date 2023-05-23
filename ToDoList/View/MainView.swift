//
//  ContentView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI
//
struct MainView: View {
    @StateObject var viewModel:MainViewViewModel = MainViewViewModel()
    
    
    var body: some View {
        NavigationView{
            if viewModel.isSignedId, !viewModel.currentUserId.isEmpty{
                TodoListView()
            }else{
                LogInView() 
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
