//
//  LogInView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel: LoginViewViewModel = LoginViewViewModel()
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, color: Color.pink)
                
                // Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLBotton(title: "Login", bgColor: .blue){
                        viewModel.login()
                        
                    }
                    .padding()
                }
                .offset(y: -120)
                // Create Account
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account") {
                        RegisterView()
                    }
                }
            }
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
