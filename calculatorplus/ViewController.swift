//
//  ViewController.swift
//  calculatorplus
//
//  Created by Nguyen Huu Thao on 29/02/2024.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonMath(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "CalculatorView", bundle: nil)
        let calculatorView = mainStoryboard.instantiateViewController(withIdentifier: "CalculatorView") as! CalculatorViewController
        navigationController?.pushViewController(calculatorView, animated: true)
    }
    
    @IBAction func buttonConvert(_ sender: Any) {
        
    }
    
    @IBAction func buttonMoney(_ sender: Any) {
    }
    
}

