//
//  ViewController.swift
//  talksy
//
//  Created by Caio Santos on 05/04/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    let tableView: UITableView = {
        let table = UITableView();
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        return table;
    }();
    
    private var models = [Question]();

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Talksy";
        view.addSubview(tableView);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.frame = view.bounds;
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addQuestion));
    }
    
    @objc private func addQuestion() {
        let alert = UIAlertController(title: "New Question",
                                      message: "Enter new Question",
                                      preferredStyle: .alert);
        
        alert.addTextField(configurationHandler: nil);
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field =  alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            let resposta = " ";
            self?.createQuestion(sentence: text,
                                 translation: text,
                                 user_answer: resposta.data(using: .utf8)!,
                                 feedback: 0,
                                 pronunciation: resposta.data(using: .utf8)!)
        }));
        present(alert, animated: true);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = model.sentence;
        return cell;
    }
    
    // Core Data
    func getAllQuestions() {
        do {
            models = try context.fetch(Question.fetchRequest());
            print("🗂️ Total de perguntas carregadas: \(models.count)")
            DispatchQueue.main.async {
                self.tableView.reloadData();
            }
        } catch {
            print("❌ Erro ao buscar perguntas: \(error)")
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
        print("✅ createQuestion chamado com frase: \(sentence)")
        let newQuestion = Question(context: context);
        newQuestion.id = UUID();
        newQuestion.sentence = sentence;
        newQuestion.translation = translation;
        newQuestion.user_answer = user_answer;
        newQuestion.feedback = feedback;
        newQuestion.pronunciation = pronunciation;
        
        do {
            try context.save();
            self.getAllQuestions();
        } catch {
            print("❌ Erro ao criar perguntas: \(error)")
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

