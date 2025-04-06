//
//  ViewController.swift
//  talksy
//
//  Created by Caio Santos on 05/04/25.
//

import UIKit

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getAllQuestions() {
        do {
            let questions = try context.fetch(Question.fetchRequest());
        } catch {
            // throw error
        }
    }
    
    func createQuestion(
        // id: UUID,
        sentence: String,
        translation: String,
        user_answer: Data,
        feedback: Int16,
        pronunciation: Data
    ) {
        let newQuestion = Question(context: context);
        newQuestion.id = UUID();
        newQuestion.sentence = sentence;
        newQuestion.user_answer = user_answer;
        newQuestion.feedback = feedback;
        newQuestion.pronunciation = pronunciation;
        
        do {
            try context.save();
        } catch {
            // throw error
        }
    }
    
    func deleteQuestion(question: Question) {
        context.delete(question);
        
        do {
            try context.save();
        } catch {
            
        }
    }
    
    func updateQuestion(
        question: Question,
        sentence: String,
        translation: String,
        user_answer: Data,
        feedback: Int16,
        pronunciation: Data
    ) {
        question.sentence = sentence;
        question.user_answer = user_answer;
        question.feedback = feedback;
        question.pronunciation = pronunciation;
        
        do {
            try context.save();
        } catch {
            // throw error
        }
    }


}

