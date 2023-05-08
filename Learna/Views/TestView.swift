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
                            
                            // all choices
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
                                        // if that choice is chosen by user and if that choice is the right answer
                                        if index == selectedAnswerIndex &&
                                            index == model.currentQuestion!.correctIndex{
                                            //show a green background
                                            RectangleCard(color: .green)
                                            
                                        }
                                        //if that choice is chosen by user and if that choice is the wrong answer
                                        
                                        else if index == selectedAnswerIndex &&
                                            index != model.currentQuestion!.correctIndex{
                                            //show a red background
                                            RectangleCard(color: .red)
                                            
                                            
                                        } // if that choice has not chosen and if this button is the correct answer
                                        else if index == model.currentQuestion!.correctIndex{
                                            //show a green background
                                            RectangleCard(color: .green)
                                            
                                        }
                                        else{
                                            //if button that not been chosen and that choice is not right answer just keep them white background 
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
                
                
                //submit button (check answer when tap)
                Button(action: {
                    //check if answer has been submitted
                    if submitted == true {
                        // if  answer is submitted then move the the nextQuestion
                        model.nextQuestion()
                        //reset properties back to flase
                        submitted = false
                        selectedAnswerIndex = nil
                    }
                    else{
                        //submit the answer
                        //and change  submit stage to true
                        submitted = true
                        // and check if answer is correct and give score
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex{
                            userScore += 1 
                        }
                    }
                }, label: {
                    ZStack{
                        RectangleCard(color: .green)
                        Text(buttonText)
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
    
    var buttonText: String{
        if submitted == true{
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count{
                return "Finish"
            }
            return "Next"
        }
        else{
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentViewModel())
    }
}
