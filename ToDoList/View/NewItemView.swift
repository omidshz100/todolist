//
//  NewItemView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel: NewItemViewViewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
    
    var body: some View {
        VStack{
            
            
            Text("Add new Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            
            Form{
                // title
                TextField("title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // date
                DatePicker("Due date ", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLBotton(title: "Save", bgColor: .pink) {
                    // actions are here
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented.toggle()
                    }else{
                        viewModel.showAlert.toggle()
                    }
                }.padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill out all fields and select due date newer than today"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
