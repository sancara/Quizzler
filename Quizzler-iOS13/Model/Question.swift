//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Santiago Caraballo on 21/01/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a:String){
        self.text = q
        self.answer = a
    }
}

struct MultipleQuestion {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a:[String], correct:String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correct
    }
}
