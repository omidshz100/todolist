//
//  LogInView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct LogInView: View {
    @State var email:String = ""
    @State var password:String = ""
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, color: Color.pink)
                // Login Form
                Form{
                    TextField("Email address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLBotton(title: "Login", bgColor: .blue){
                        // atempt login
                        
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
                }.padding(.bottom, 50)
                Spacer()
            }
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
