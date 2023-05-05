//
//  ContentView.swift
//  Learna
//
//  Created by Jessie P on 4/29/23.
//

import Foundation
class ContentViewModel: ObservableObject{
    //List of mudules
    @Published var modules =  [Module]()
    
   //Current module
    @Published var currentModule: Module? // set as an optional
    var currentModuleIndex = 0
    
    //Current lesson
    @Published var currentLesson: Lesson? // set as an optional
    var currentLessonIndex = 0
    
    //current lesson explanation
    @Published var lessonDescription  =  NSAttributedString()
    var styleData: Data?
    
    // Current selected content and test
    @Published var currentContentSelected: Int?
    
    init(){
       getLocalData()
    }
    
   //MARK: Data Method
    func getLocalData(){
         
        //parsing  Json data
        let urlString = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do{
            let data = try Data(contentsOf: urlString!)
            let decoder = JSONDecoder()
            let moduleData = try decoder.decode([Module].self, from: data)
            
            // Assign moduleData to var modules if pasring has successful.
            self.modules = moduleData
        
        }
        catch{
            print("cannot parsing json data")
        }
        
        //parsing style data
        //try to read file HTML by transform to data Object
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        catch{
            print("cannot parsing style data")
        }
        
    }
    
    //MARK: Module Navigation Method
    func beginModule(_ moduleId: Int){
        for index in 0..<modules.count{
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    
    //MARK: Lesson Navigation Method
    func beginLesson(_ lessonIndex: Int){
       // check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
        }
        else{
            currentLessonIndex = 0
            
        }
        //set the current lesson and current description
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func hasNextLesson()->Bool{
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    func nextLesson(){
        //Advance the lesson Index
        currentLessonIndex += 1
        //Check that it is withn range
        if currentLessonIndex < currentModule!.content.lessons.count{
            // set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else{
            //reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    
    
    //MARK: Attributed String Method(Code styling)
    private func addStyling(_ htmlString : String)-> NSAttributedString{
        var resultString = NSAttributedString()
        var data = Data()
        //add styling data
        if styleData != nil{
            data.append(styleData!)
        }
        //add html data
        data.append(Data(htmlString.utf8))
        //convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil){
            resultString = attributedString
        }
        return resultString
    }
}
