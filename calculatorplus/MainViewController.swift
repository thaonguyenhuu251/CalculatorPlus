//
//  MainViewController.swift
//  calculatorplus
//
//  Created by MacMini on 07/03/2024.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
    }
    @IBAction func buttonMath(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "CalculatorView", bundle: Bundle.main)
        let calculatorView = mainStoryboard.instantiateViewController(withIdentifier: "CalculatorView") as! CalculatorViewController
        navigationController?.pushViewController(calculatorView, animated: true)
    }
    
    @IBAction func buttonConvert(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CalculatorView", bundle: Bundle.main)
        let profileModalVC = storyboard.instantiateViewController(withIdentifier: "CalculatorView") as? CalculatorViewController
        present(profileModalVC!, animated: true, completion: nil)
    }
    
    @IBAction func buttonMoney(_ sender: Any) {
        
    }
}
