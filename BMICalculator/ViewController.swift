//
//  ViewController.swift
//  BMICalculator
//
//  Created by t2023-m0032 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var Labels: [UILabel]!
    
    var height = 0.0
    var weight = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Labels[0].text = "BMI Calculator"
        Labels[0].font = .boldSystemFont(ofSize: 25)
        
        Labels[1].text = "당신의 BMI 지수를 알려드릴게요"
        Labels[1].font = .systemFont(ofSize: 15)
        Labels[1].numberOfLines = 0
        
        image.image = UIImage(named: "image")
        
        Labels[2].text = "키가 어떻게 되시나요?"
        Labels[2].font = .systemFont(ofSize: 15)
        Labels[3].text = "몸무게는 어떻게 되시나요?"
        Labels[3].font = .systemFont(ofSize: 15)
        
        for i in 0...textFields.count-1 {
            textFields[i].layer.cornerRadius = 10
            textFields[i].layer.borderWidth = 2
            textFields[i].layer.borderColor = UIColor.black.cgColor
        }
        
        buttons[0].setTitle("랜덤으로 BMI 계산하기", for: .normal)
        buttons[0].tintColor = .red
        buttons[0].titleLabel?.font = .systemFont(ofSize: 12)
        buttons[0].contentHorizontalAlignment = .right
        
        buttons[1].setTitle("결과 확인", for: .normal)
        buttons[1].tintColor = .white
        buttons[1].titleLabel?.font = .systemFont(ofSize: 25)
        buttons[1].backgroundColor = .purple
        buttons[1].layer.cornerRadius = 15
    }
    func alert(_ string: String) {
        let alert = UIAlertController(title: string, message: nil, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        height = Double(Int.random(in: 100...300))
        weight = Double(Int.random(in: 10...200))
        textFields[0].text = "\(height)"
        textFields[1].text = "\(weight)"
    }
    @IBAction func ChangedTextFields(_ sender: UITextField) {
        let num = Double(sender.text!)
        if num != nil {
            if sender.tag == 0 {
                height = num!
            } else {
                weight = num!
            }
        }
        else {
            //숫자 하나 남았을 때 지우면 ""만 남아서 alert뜨는거 방지
            if sender.text != "" {
                alert("숫자만 입력해주세요")
                sender.text?.removeLast()
            }
        }
    }
    @IBAction func resultButton(_ sender: UIButton) {
        if height > 300 || height < 100 {
            alert("정상적인 키를 입력해주세요")
        } else if weight > 200 || weight < 10 {
            alert("정상적인 몸무게를 입력해주세요")
        } else {
            let bmi = weight / (height*height*0.0001)
            alert("BMI: "+String(format: "%.2f", bmi))
        }
    }
}

