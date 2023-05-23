//
//  RegisterView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct RegisterView: View {
    @State var email:String = ""
    @State var password:String = ""
    @State var fullname:String = ""
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register", subTitle: "Start organizing todo", angle: -15, color: Color.orange)
            // Login Form
            Form{
                TextField("FullName", text: $fullname)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLBotton(title: "Create account", bgColor: .green){
                    // atempt registeration
                    
                }
                .padding()
            }
            .offset(y: -30)
            // Create Account
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
