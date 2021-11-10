//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 美並　明伸 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    var questions: [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "questions") != nil{
            questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
        }
        showQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questions = []
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "questions") != nil{
            questions = userDefaults.object(forKey: "questions") as![[String: Any]]
        }
        showQuestion()
    }
    
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion(){
        if questions.isEmpty == true {
            questionLabel.text = "問題がありません、問題を作りましょう！"
        } else {
            let question = questions[currentQuestionNum]
            
            if let que = question["question"] as? String {
                questionLabel.text = que
            }
        }
    }
    
    
    func checkAnswer(yourAnswer: Bool){
        if questions.isEmpty == true {
            
        } else {
            let question = questions[currentQuestionNum]
            
            if let ans = question["answer"] as? Bool {
                if yourAnswer == ans {
                    currentQuestionNum += 1
                    showAlert(message: "正解！")
                } else {
                    showAlert(message: "不正解…")
                }
            } else {
                print("答えが入ってません")
                return
            }
            
            if currentQuestionNum >= questions.count {
                currentQuestionNum = 0
            }
            
            showQuestion()
        }
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}

