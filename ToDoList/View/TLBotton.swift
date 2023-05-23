//
//  TLBotton.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct TLBotton: View {
    var title:String
    var bgColor:Color
    var action:()->Void
    
    var body: some View {
        Button{
            // do something here
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }.padding()
        }
    }
}

struct TLBotton_Previews: PreviewProvider {
    static var previews: some View {
        TLBotton(title: "title", bgColor: .blue){
            
        }
    }
}
