//
//  CalculatorViewController.swift
//  calculatorplus
//
//  Created by Nguyen Huu Thao on 03/03/2024.
//

import UIKit

class CalculatorViewController: UIViewController {
    var expand = false
    var expression = ""
    var result = ""
    
    @IBOutlet weak var labelExpression: UILabel!
    @IBOutlet weak var mathOneView: UIStackView!
    @IBOutlet weak var mathTwoView: UIStackView!
    
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonPi: UIButton!
    @IBOutlet weak var buttonPow: UIButton!
    @IBOutlet weak var buttonGT: UIButton!
    @IBOutlet weak var buttonSqrt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func expandKeyboard(_ sender: Any) {
        mathOneView.isHidden = expand
        mathTwoView.isHidden = expand
        buttonE.isHidden = expand
        buttonPi.isHidden = expand
        buttonPow.isHidden = expand
        buttonGT.isHidden = expand
        buttonSqrt.isHidden = expand
        expand = !expand
    }
    
    @IBAction func buttonHistory(_ sender: Any) {
        mathOneView.isHidden = expand
        mathTwoView.isHidden = expand
        buttonE.isHidden = expand
        buttonPi.isHidden = expand
        buttonPow.isHidden = expand
        buttonGT.isHidden = expand
        buttonSqrt.isHidden = expand
        expand = !expand
    }
    
    @IBAction func buttonSin(_ sender: Any) {
        expression += "Sin("
        labelExpression.text = expression
    }
    
    @IBAction func buttonCos(_ sender: Any) {
        expression += "Cos("
        labelExpression.text = expression
    }
    
    @IBAction func buttonTan(_ sender: Any) {
        expression += "Tan("
        labelExpression.text = expression
    }
    
    
    @IBAction func buttonRad(_ sender: Any) {
        
    }
    
    @IBAction func buttonDeg(_ sender: Any) {
    }
    
    @IBAction func buttonLog(_ sender: Any) {
    }
    
    @IBAction func buttonLn(_ sender: Any) {
    }
    
    @IBAction func bottonOpenClose(_ sender: Any) {
    }
    
    @IBAction func buttoNaBS(_ sender: Any) {
    }
    
    @IBAction func buttonExp(_ sender: Any) {
    }
    
    @IBAction func buttonE(_ sender: Any) {
    }
    
    @IBAction func buttonDeleteAll(_ sender: Any) {
    }
    
    @IBAction func buttonPercent(_ sender: Any) {
    }
    
    @IBAction func buttonDelete(_ sender: Any) {
    }
    
    @IBAction func buttonDevide(_ sender: Any) {
    }
    
    @IBAction func buttonPi(_ sender: Any) {
    }
    
    @IBAction func buttonSeven(_ sender: Any) {
        expression += "7"
        labelExpression.text = expression
    }
    
    @IBAction func buttonEight(_ sender: Any) {
        expression += "8"
        labelExpression.text = expression
    }
    
    @IBAction func buttonNine(_ sender: Any) {
        expression += "9"
        labelExpression.text = expression
    }
    
    @IBAction func buttonMulti(_ sender: Any) {
        expression += "-"
        labelExpression.text = expression
    }
    
    @IBAction func buttonPow(_ sender: Any) {
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        expression += "4"
        labelExpression.text = expression
    }
    
    @IBAction func buttonFive(_ sender: Any) {
        expression += "5"
        labelExpression.text = expression
    }
    
    @IBAction func buttonSix(_ sender: Any) {
        expression += "6"
        labelExpression.text = expression
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        expression += "-"
        labelExpression.text = expression
    }
    
    @IBAction func buttonGT(_ sender: Any) {
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        expression += "1"
        labelExpression.text = expression
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        expression += "2"
        labelExpression.text = expression
    }
    @IBAction func buttonThree(_ sender: Any) {
        expression += "3"
        labelExpression.text = expression
    }
    @IBAction func buttonTotal(_ sender: Any) {
        expression += "+"
        labelExpression.text = expression
    }
    
    @IBAction func buttonZero(_ sender: Any) {
        expression += "00"
        labelExpression.text = expression
    }
    
    @IBAction func button0(_ sender: Any) {
        expression += "0"
        labelExpression.text = expression
    }
    
    @IBAction func buttonDot(_ sender: Any) {
        expression += "."
        labelExpression.text = expression
    }
    
    
    @IBAction func buttonResult(_ sender: Any) {
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
