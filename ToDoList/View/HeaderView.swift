//
//  HeaderView.swift
//  ToDoList
//
//  Created by Omid Shojaeian Zanjani on 23/05/23.
//

import SwiftUI

struct HeaderView: View {
    var title:String
    var subTitle:String
    var angle:Double
    var color:Color
    
    
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subTitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 30 )
            }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
                .offset(y: -200)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "a", subTitle: "b", angle: 15, color: Color.red)
    }
}
