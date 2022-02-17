//
//  MultipleQuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Santiago Caraballo on 17/02/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct MultipleQuestionBrain {
    let multipleQuiz = [
        MultipleQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correct: "Skin"),
        MultipleQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correct: "100"),
        MultipleQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correct: "Greenwich Mean Time"),
        MultipleQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correct: "Chapeau"),
        MultipleQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correct: "Watch"),
        MultipleQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correct: "Adiós"),
        MultipleQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correct: "Orange"),
        MultipleQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correct: "Rum"),
        MultipleQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correct: "Gorilla"),
        MultipleQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correct: "Australia")
    ]

    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
         if userAnswer == multipleQuiz[questionNumber].correctAnswer {
             self.score += 1
             return true
         } else {
            return false
         }
     }
    
    func getQuestionText() -> String {
        return multipleQuiz[questionNumber].text
    }
    
    func getOptionText() -> [String] {
        return multipleQuiz[questionNumber].answer
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(multipleQuiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < multipleQuiz.count - 1 {
            self.questionNumber += 1
        } else {
            self.questionNumber = 0
            self.score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    
}
