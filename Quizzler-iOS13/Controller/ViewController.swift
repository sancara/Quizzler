//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
   
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        updateUI()
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItWright = quizBrain.checkAnswer(userAnswer)
        
        
        
        if quizBrain.questionNumber < quizBrain.quiz.count - 1 {
            quizBrain.questionNumber += 1
        } else {
            quizBrain.questionNumber = 0
        }
        
        if userGotItWright {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.updateUI()
        }
        
        
        
        
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
}

