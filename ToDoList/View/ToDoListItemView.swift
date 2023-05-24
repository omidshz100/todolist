//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct ToDoListItemView: View {
    let item:ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.titel)
                    .font(.title)
                    .bold()
                Text("\( Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened)   ) )")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            Button{
                
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", titel: "Milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false ))
    }
}
