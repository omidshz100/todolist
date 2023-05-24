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
                if let user = viewModel.user {
                    profile(user: user)
                }else{
                    Text("Loading data ......")
                }
                
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.FetchUser()
        }
    }
    
    @ViewBuilder
      func profile(user:User)-> some View {
          // Avatar
          Image(systemName: "person.circle")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .foregroundColor(Color.blue)
              .frame(width: 125, height: 125)
              .padding( )
          
          // Info : name, email, member since
          VStack(alignment: .leading) {
              HStack{
                  Text("Name:")
                      .bold()
                  Text("\(user.name)")
              }
              .padding()
              HStack{
                  Text("email:")
                      .bold()
                  Text("\(user.email)")
              }
              .padding()
              HStack{
                  Text("since:")
                      .bold()
                  Text("\( Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened)  ) ")
              }
              .padding()
          }.padding()
          // sign out
          Button( "Log out") {
              viewModel.logout()
          }
          .tint(Color.red)
          .padding()
          Spacer()
      }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
