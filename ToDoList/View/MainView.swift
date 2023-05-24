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
                accountView 
            }else{
                LogInView() 
            }
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListView(userID: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage:"house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
