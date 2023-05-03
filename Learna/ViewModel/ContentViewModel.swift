//
//  ContentView.swift
//  Learna
//
//  Created by Jessie P on 4/29/23.
//

import Foundation
class ContentViewModel: ObservableObject{
    @Published var modules =  [Module]()
    var styleData: Data?
    
    @Published var currentModule: Module? // set as an optional
    var currentModuleIndex = 0
    
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
    //MARK: Mudule Navigation Method
    func beginModule(_ moduleId: Int){
        for index in 0..<modules.count{
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    
}
