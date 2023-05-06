//
//  TestView.swift
//  Learna
//
//  Created by Jessie P on 5/6/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model : ContentViewModel
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack{
                //Question Number
                Text("Question\(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                //Question
                CodeTextView()
                //Answers
                
                //
             
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else{
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentViewModel())
    }
}
