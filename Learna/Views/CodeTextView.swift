//
//  CodeTextView.swift
//  Learna
//
//  Created by Jessie P on 5/4/23.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
   
    @EnvironmentObject var model: ContentViewModel
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        //set attributed text for the lesson
        textView.attributedText = model.codeText
        //Scroll up to the top
        
    }
    
}

