//
//  ContentViewRow.swift
//  Learna
//
//  Created by Jessie P on 5/3/23.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model: ContentViewModel
    var index: Int
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        // lesson card
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 20){
                
                Text(String(index + 1))
                    .bold()
                    .padding(.leading)
                
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
                .padding()
            }
        }
      
        }
    }
