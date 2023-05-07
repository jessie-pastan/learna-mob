//
//  TestView.swift
//  Learna
//
//  Created by Jessie P on 5/6/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model : ContentViewModel
    @State var selectedAnswerIndex: Int?
    @State var userScore = 0
    @State var submitted = false
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack{
                //Question Number
                Text("Question\(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                //Question
                CodeTextView()
                
                //Answers
                ScrollView{
                    VStack{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) {index in
                            
                            
                            Button(action: {
                                selectedAnswerIndex = index
                            }, label: {
                                ZStack {
                                    // if answer has not submitted yet
                                    if submitted == false{
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                       
                                    }
                                    else{
                                        // if answer has been submitted
                                        // if user chose the right answer
                                        if index == selectedAnswerIndex &&
                                            index == model.currentQuestion!.correctIndex{
                                            //show a green background
                                            RectangleCard(color: .green)
                                            
                                        }
                                        // if user chose the wrong answer
                                        else if index == selectedAnswerIndex &&
                                                    index != model.currentQuestion!.correctIndex{
                                            //show a red background
                                            RectangleCard(color: .red)
                                            
                                            
                                        } // if this button is the correct answer
                                        else if index == model.currentQuestion!.correctIndex{
                                            //show a green background
                                            RectangleCard(color: .green)
                                            
                                        }
                                        else{
                                            //if button that not been chosen
                                            RectangleCard(color: .white)
                                        }
                                    }
                                        
                                        Text(model.currentQuestion!.answers[index])
                                        .foregroundColor(.black)
                                    }
                            })
                            .disabled(submitted)
                        }
                        .padding(5)
                        .accentColor(.black)
                        
                    }.padding()
                    
                }
                
                
                //check Answer
                Button(action: {
                    submitted = true
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex{
                        userScore += 1 
                    }
                }, label: {
                    ZStack{
                        RectangleCard(color: .green)
                        Text("Submit")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                })
                .disabled(selectedAnswerIndex == nil)
             
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
