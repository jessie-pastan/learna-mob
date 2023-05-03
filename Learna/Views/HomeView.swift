//
//  ContentView.swift
//  Learna
//
//  Created by Jessie P on 4/29/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentView
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading){
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules){ module in
                            // create learing cards
                            HomeViewRow(title: "Learn \(module.category)", image: module.content.image, description: module.content.description, lesson: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            
                            // create test cards
                            HomeViewRow(title: "\(module.category) Test", image: module.test.image, description: module.test.description, lesson: "\(module.test.questions.count) Questions", time: module.test.time)
                            
                            
                        }
                        .padding()
                    }
                }
                
                
            }
            .navigationTitle("Get Started")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentView())
    }
}
