//
//  ContentView.swift
//  Learna
//
//  Created by Jessie P on 5/3/23.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var model: ContentViewModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                //confirm that currentModule is set first//
                if model.currentModule != nil{
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self ){ index in
                        NavigationLink(
                            destination:
                            ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                    
                                    
                        }),
                            label: {
                            ContentViewRow(index: index)
                        })
                        
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
        
    }
}
