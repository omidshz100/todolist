//
//  ProfileView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 24/05/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel:ProfileViewViewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Profile")
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
