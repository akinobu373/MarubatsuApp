//
//  QuestionViewController.swift
//  MarubatsuApp
//
//  Created by 美並　明伸 on 2021/11/08.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionFiled: UITextField!
    @IBOutlet weak var answerButton: UISegmentedControl!
    var questions:[[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func topButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func questionSaveButtonAction(_ sender: Any) {
        if questionFiled.text! != "" {
            var answer: Bool = true
        
            if answerButton.selectedSegmentIndex == 0{
                answer = false
            }else{
                answer = true
            }
            let userDefaults = UserDefaults.standard
            questions = []
            
            if userDefaults.object(forKey: "questions") != nil{
                questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
            }
            
            questions.append(
                [
                    "question": questionFiled.text!,
                    "answer": answer
                    
                ])
            userDefaults.set(questions, forKey: "questions")
            showAlert(message: "問題が保存されました")
            questionFiled.text = ""
            
        }else{
            showAlert(message: "問題を入力して下さい。")
        }
    }
    
    @IBAction func deletaButtonAction(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "questions")
        userDefaults.set([], forKey: "questions")
        showAlert(message: "問題をすべて削除しました。")
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
