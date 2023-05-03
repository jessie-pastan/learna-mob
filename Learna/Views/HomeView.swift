//
//  ContentView.swift
//  Learna
//
//  Created by Jessie P on 4/29/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading){
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules){ module in
                            
                            NavigationLink(destination:
                                            ContentView()
                                            .onAppear(perform: {
                                model.beginModule(module.id)
                            })
                                           
                                , label: {
                                
                                // create learning card
                                VStack {
                                    HomeViewRow(title: "Learn \(module.category)", image: module.content.image, description: module.content.description, lesson: "\(module.content.lessons.count) lessons", time: "\(module.content.time)")
                                    
                                    
                                    // create test card
                                    HomeViewRow(title: "\(module.category) Test", image: module.test.image, description: module.test.description, lesson: "\(module.test.questions.count) lessons", time: "\(module.test.time)")
                                }
                                
                            })
                            
                            
                            
                        }
                        .padding()
                    }
                    .accentColor(.black)
                    
                }
                
                
            }
            .navigationTitle("Get Started")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentViewModel())
    }
}
