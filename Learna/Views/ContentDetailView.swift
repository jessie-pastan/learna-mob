//
//  ContentDetailView.swift
//  Learna
//
//  Created by Jessie P on 5/3/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    var body: some View {
            let lesson = model.currentLesson
            let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack{
            //only show if we get a valid url
            if let urlString = url{
                VideoPlayer(player: AVPlayer(url: urlString))
                    .frame(height:300)
                
                
            }
            //description
            CodeTextView()
            
            
            //check if there is more lesson
            if model.hasNextLesson(){
                //show more lesson
                Button(action:{
                    model.nextLesson()
                }, label: {
                    ZStack{
                        
                        RectangleCard(color: Color.green)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .bold()
                        
                    }
                    .accentColor(.black)
                    .padding()
                    
                    
                })
            }
            else{
                Button(action:{
                    //take user back to the HomeView
                    model.currentContentSelected = nil
                }, label: {
                    ZStack{
                        RectangleCard(color: Color.green)
                            
                        Text("Complete")
                            .bold()
                        
                    }
                    .accentColor(.black)
                    .padding()
                    
                    
                })
                
                
                
            }
        }
        .navigationTitle(lesson?.title ?? "")
        
    }
}



