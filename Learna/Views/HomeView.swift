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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
