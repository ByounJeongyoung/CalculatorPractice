//
//  ViewController.swift
//  CalculatorPractice
//
//  Created by Young on 2021/09/08.
//

import UIKit
enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unKonw
}
class ViewController: UIViewController {
    
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var percentBurron: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    
    @IBOutlet weak var DisplayResult: UILabel!
    
    
    var storeNumber = ""
    var fistNumber = ""
    var secondNumber = ""
    var result = ""
    var currentOperation: Operation = .unKonw
        
    @IBOutlet weak var zeroButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func tabNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else {return}
   
  
            if self.storeNumber.count < 9 {
                        self.storeNumber += numberValue
                        self.DisplayResult.text = self.storeNumber
                    }
        }
        
    //myString.remove(at: myString.startIndex)
    
    
    @IBAction func tabClearButton(_ sender: UIButton) {
        self.storeNumber = ""
        self.fistNumber = ""
        self.secondNumber = ""
        self.result = ""
        self.currentOperation = .unKonw
        self.DisplayResult.text = "0"
    }
    
    @IBAction func tabDivideButton(_ sender: UIButton) {
        operation(.Divide)
    }
    
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
        operation(.Multiply)
    }
    @IBAction func tabSubtractButton(_ sender: UIButton) {
        operation(.Subtract)
    }
    @IBAction func tapPlusButton(_ sender: UIButton) {
        operation(.Add)
    }
    
    @IBAction func tabEqualButton(_ sender: UIButton) {
        operation(currentOperation)
    }
    @IBAction func dotButton(_ sender: UIButton) {
        if self.storeNumber.count < 8, !self.storeNumber.contains("."){
            self.storeNumber += self.storeNumber.isEmpty ? "0." : "."
            self.DisplayResult.text = self.storeNumber
        }
    }
    
    func operation(_ operation: Operation) {
        //연산자를 누른적이 있다
        //즉,아래 else구문에서 연산자를 저장 시켰으므로 이 부분 통과 가능하다
        if self.currentOperation != .unKonw {
            
            //아래 구문중 "2.숫자도 입력하지 않고 바로 연산자 입력한경우" 이러한경우 즉 연산자만 눌렀을경우 두번째에는 통과가 된다 이를 방지하기 위해 숫자를 넣으면 첫번째로 저장되는(공통) storeNumber의 수가 있는지 확인한다
            if !self.storeNumber.isEmpty{
                
                self.secondNumber = self.storeNumber
                self.storeNumber = ""
                guard let firstOperand = Double(self.fistNumber) else { return }
                guard let secondOperand = Double(self.secondNumber) else {return}
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                if let result = Double(self.result),result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.DisplayResult.text = self.result //값 보여주기
                self.storeNumber = self.result //2 + 3  == 5 + 3 = 4  => 이런경우 결과값을 first에 넣어준다
            }
            self.currentOperation = operation
            
        }
        //연산자를 누른적이 없다
        //1.숫자를 입력하고 바로 연산자 부터 누른경우
        //2.숫자도 입력하지 않고 바로 연산자 입력한경우
        else{
            //1.저장된 수가 있었다면 첫번째 피 연산자에 넣어준다
            //2.저장된 수를 비로소 첫번째 연산자에 넣어준다
            //cf)첫번째 연산자의 수를 바로 받지 않는 이유는 재사용을위해
            //3.현재 함수는 연산자를 눌렀을경우 실행 => 즉 지금 인수로 받은 연산자를 "저장" 해줘야 한다
            self.fistNumber = self.storeNumber
            self.storeNumber = ""
            self.currentOperation = operation
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
         makeRound(ACButton)
         makeRound(subButton)
         makeRound(percentBurron)
         makeRound(divideButton)
         makeRound(multiplyButton)
         makeRound(minusButton)
         makeRound(plusButton)
         makeRound(resultButton)
         makeRound(dotButton)
         makeRound(num1)
         makeRound(num2)
         makeRound(num3)
         makeRound(num4)
         makeRound(num5)
         makeRound(num6)
         makeRound(num7)
         makeRound(num8)
         makeRound(num9)
         zeroButton.layer.cornerRadius = 50
         zeroButton.clipsToBounds = true
    }
    
    func makeRound (_ button: UIButton){
        button.layer.cornerRadius =  0.5 * button.bounds.size.height
    }


}

