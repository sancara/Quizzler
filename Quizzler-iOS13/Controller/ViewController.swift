//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //True or False
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //multipleChoice Game
    @IBOutlet weak var multipleChoiceScoreLabel: UILabel!
    @IBOutlet weak var multipleChoiceQuestionLabel: UILabel!
    @IBOutlet weak var multipleChoiceProgressBar: UIProgressView!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    var quizBrain = QuizBrain()
    var multipleQuiz = MultipleQuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Multiple Choice
//        multipleChoiceProgressBar.progress = 0.0
//        updateMUI()
        
        //True or False
        progressBar.progress = 0.0
        updateUI()
        
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItWright = quizBrain.checkAnswer(userAnswer)
        
    
        if userGotItWright {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.updateUI()
        }
        
        
        
        
    }
    
    @IBAction func multipleAnswerChoice(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItWright = multipleQuiz.checkAnswer(userAnswer)
        
        if userGotItWright {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        multipleQuiz.nextQuestion()
        
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.updateMUI()
        }
    }
    
    
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func updateMUI() {
        multipleChoiceQuestionLabel.text = multipleQuiz.getQuestionText()
        multipleChoiceProgressBar.progress = multipleQuiz.getProgress()
        multipleChoiceScoreLabel.text = "Score: \(multipleQuiz.getScore())"
        firstChoiceButton.backgroundColor = UIColor.clear
        secondChoiceButton.backgroundColor = UIColor.clear
        thirdChoiceButton.backgroundColor = UIColor.clear
    }
}

