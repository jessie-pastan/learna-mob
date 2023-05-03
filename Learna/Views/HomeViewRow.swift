//
//  HomeViewRow.swift
//  Learna
//
//  Created by Jessie P on 5/2/23.
//

import SwiftUI

struct HomeViewRow: View {
    
    var title: String
    var image: String
    var description: String
    var lesson: String
    var time: String
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 4)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                
            
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 110, height: 110)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
                Spacer()
                VStack(alignment: .leading){
                    Text(title)
                        .bold()
                        .padding(.bottom, 10)
                    Text(description)
                        .font(.caption)
                        .padding(.bottom, 20)
                    
                    HStack{
                        Image(systemName: "text.book.closed")
                            .frame(width: 15, height: 15)
                        Text("\(lesson)")
                            .font(.caption)
                        
                        Image(systemName: "clock")
                            .frame(width: 15, height: 15)
                        
                        let timeNumber = time.split(separator: " ")
                            
                        Text(timeNumber[0]  + " " + "Hours")
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal,20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(title: "Swift", image: "swift", description: "Understand the fundamentals of Swift programming language ", lesson: "20", time: "10 Hours")
    }
}
