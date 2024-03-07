//
//  BaseViewController.swift
//  calculatorplus
//
//  Created by MacMini on 07/03/2024.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func showViewController<T: UIViewController>(viewController: T.Type, storyboardId: String, nameStoryboard: String) -> () {
        let storyboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        addChild(vc)
        DispatchQueue.main.async {
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                vc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                vc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                vc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                vc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        }
        vc.didMove(toParent: self)
    }

}
