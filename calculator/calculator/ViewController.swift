//
//  ViewController.swift
//  calculator
//
//  Created by 조병진 on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var num0Button: UIButton!
    @IBOutlet weak var num1Button: UIButton!
    @IBOutlet weak var num2Button: UIButton!
    @IBOutlet weak var num3Button: UIButton!
    @IBOutlet weak var num4Button: UIButton!
    @IBOutlet weak var num5Button: UIButton!
    @IBOutlet weak var num6Button: UIButton!
    @IBOutlet weak var num7Button: UIButton!
    @IBOutlet weak var num8Button: UIButton!
    @IBOutlet weak var num9Button: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    var calculatNumber: Double? = nil
    var nowOption: String? = nil
    var resetOutputLabel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButtonDidTap(_ Sender: UIButton) {
        acButton.setTitle("AC", for: .normal)
        outputLabel.text = "0"
        optionButtonColorReset()
        nowOption = nil
        resetOutputLabel = false
    }
    
    @IBAction func numberButtonDidTap(sender: UIButton){
        acButton.setTitle("C", for: .normal)
        let inputNum = sender.currentTitle!
        if outputLabel.text! != "0" {
            if resetOutputLabel == true {
                outputLabel.text = ""
                resetOutputLabel = false
            }
            let outputLabelText = outputLabel!.text!
            outputLabel.text = outputLabelText + "\(inputNum)"
        }
        else {
            outputLabel.text = "\(inputNum)"
        }
    }
    
    //MARK: - 기호버튼 함수
    @IBAction func optionButtonDidTap(_ sender: UIButton) {
        acButton.setTitle("C", for: .normal)
        let inputoption = sender.currentTitle!
        if inputoption == "=" {
            guard calculatNumber == nil || nowOption == nil else {
                calculat(nowOption)
                optionButtonColorReset()
                nowOption = nil
                resetOutputLabel = true
                calculatNumber = nil
                return
            }
        }
        else if inputoption == "+" {
            if nowOption != nil {
                calculat(nowOption)
                nowOption = "+"
                optionButtonColorReset()
                optionAction(sender)
            }
            else {
                calculat(nowOption)
                nowOption = "+"
                optionAction(sender)
                return
            }
        }
        else if inputoption == "-" {
            if nowOption != nil {
                calculat(nowOption)
                nowOption = "-"
                optionButtonColorReset()
                optionAction(sender)
            }
            else {
                calculat(nowOption)
                nowOption = "-"
                optionAction(sender)
                return
            }
        }
        else if inputoption == "×" {
            if nowOption != nil {
                calculat(nowOption)
                nowOption = "X"
                optionButtonColorReset()
                optionAction(sender)
            }
            else {
                calculat(nowOption)
                nowOption = "X"
                optionAction(sender)
                return
            }
        }
        else if inputoption == "÷" {
            if nowOption != nil {
                calculat(nowOption)
                nowOption = "/"
                optionButtonColorReset()
                optionAction(sender)
            }
            else {
                calculat(nowOption)
                nowOption = "/"
                optionAction(sender)
                return
            }
        }
        else if inputoption == "+/-" {
            var labelValue = Double(outputLabel!.text!)!
            labelValue *= -1
            if intOrNot(labelValue) {
                outputLabel.text = "\(Int(labelValue))"
            }
            else {
                outputLabel.text = "\(labelValue)"
            }
        }
        else if inputoption == "%" {
            var labelValue = Double(outputLabel!.text!)!
            labelValue /= 100
            if intOrNot(labelValue) {
                outputLabel.text = "\(Int(labelValue))"
            }
            else {
                outputLabel.text = "\(labelValue)"
            }
        }
    }
    
    @IBAction func dotButtonDidTap(_ Button: UIButton) {
        let outputLabelText = outputLabel!.text!
        if outputLabelText.contains(".") == false {
            acButton.setTitle("C", for: .normal)
            if resetOutputLabel == true {
                outputLabel.text = "0"
                resetOutputLabel = false
            }
            let outputLabelText = outputLabel!.text!
            outputLabel.text = outputLabelText + "."
        }
    }
    
    @IBAction func backSpace() {
        if resetOutputLabel == false {
            var labelValue = String(outputLabel.text!)
            if labelValue != "0" {
                labelValue = String(labelValue.dropLast())
                if labelValue == "" {
                    outputLabel.text = "0"
                }
                else {
                    outputLabel.text = labelValue
                }
            }
        }
    }
    
    //MARK: - 계산 함수
    func calculat(_ option: String?) {
        if let labelValue = Double(outputLabel.text!) {
            if option != nil && calculatNumber != nil {
                switch option {
                case "+":
                    if intOrNot(labelValue + calculatNumber!) {
                        outputLabel.text = "\(Int(labelValue + calculatNumber!))"
                    }
                    else {
                        outputLabel.text = "\(labelValue + calculatNumber!)"
                    }
                    break;
                case "-":
                    if intOrNot(calculatNumber! - labelValue) {
                        outputLabel.text = "\(Int(calculatNumber! - labelValue))"
                    }
                    else {
                        outputLabel.text = "\(calculatNumber! - labelValue)"
                    }
                    break;
                case "/":
                    if labelValue != 0.0 {
                        if intOrNot(calculatNumber! / labelValue) {
                            outputLabel.text = "\(Int(calculatNumber! / labelValue))"
                        }
                        else {
                            outputLabel.text = "\(calculatNumber! / labelValue)"
                        }
                    }
                    else {
                        outputLabel.text = "오류"
                    }
                    break;
                case "X":
                    if intOrNot(labelValue * calculatNumber!) {
                        outputLabel.text = "\(Int(labelValue * calculatNumber!))"
                    }
                    else {
                        outputLabel.text = "\(labelValue * calculatNumber!)"
                    }
                    break;
                default:
                    outputLabel.text = "오류"
                    break;
                }
            }
        }
        else {
            outputLabel.text = "오류"
            resetOutputLabel = true
        }
        
    }
    
    //MARK: - 정수판별 함수
    func intOrNot(_ number: Double) -> Bool {
        var inNum = number
        if inNum < 0 {
            inNum *= -1
        }
        let ceilIntNum = Int(ceil(inNum))
        print("\(ceilIntNum), \(inNum)")
        if ceilIntNum == Int(inNum) {
            return true
        }
        else {
            return false
        }
    }
    
    //MARK: - 버튼색 변경 함수
    func optionAction(_ sender: UIButton) {
        calculatNumber = Double(outputLabel!.text!)
        resetOutputLabel = true
        sender.backgroundColor = UIColor.white
        sender.setTitleColor(.systemOrange, for: .normal)
    }
    
    func optionButtonColorReset() {
        plusButton.backgroundColor = UIColor.systemOrange
        plusButton.setTitleColor(.white, for: .normal)
        subtractButton.backgroundColor = UIColor.systemOrange
        subtractButton.setTitleColor(.white, for: .normal)
        divisionButton.backgroundColor = UIColor.systemOrange
        divisionButton.setTitleColor(.white, for: .normal)
        multiplyButton.backgroundColor = UIColor.systemOrange
        multiplyButton.setTitleColor(.white, for: .normal)
    }
}
