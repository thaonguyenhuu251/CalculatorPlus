//
//  MainViewController.swift
//  calculatorplus
//
//  Created by MacMini on 07/03/2024.
//

import UIKit
import FirebaseDatabaseInternal

class MainViewController: BaseViewController {
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    
    @IBOutlet weak var buttonSideMenu: UIButton!
    
    var ref: DatabaseReference!
    private let database = Database.database().reference()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        database.child("ApplicationCalculatorPlusIos").child("versionName").observe(.value) {
            (snap: DataSnapshot) in
            if let snapVersion = snap.value as? String,
               let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String,
               let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
                let comparisonResult = self.compareVersions(localVersion: version, apiVersion: snapVersion)
                switch comparisonResult {
                case .orderedAscending:
                    let alert = UIAlertController(
                        title: appName + " .Now there is a new version ! ",
                        message: "The version you are currently using "
                        +  version
                        + ". Do you want to update to version "
                        + snapVersion
                        + " ? ",
                        preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(
                        title: "Ok",
                        style: UIAlertAction.Style.default,
                        handler: { action in
                            guard let appStoreURL = URL(string: "https://apps.apple.com/app/your-app-name/idYourAppID") else {
                                        return
                                    }
                                    UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
                        }
                    ))
                    alert.addAction(UIAlertAction(
                        title: "Cancel",
                        style: UIAlertAction.Style.default, handler: nil
                    ))
                    self.present(alert, animated: true, completion: nil)
                case .orderedDescending:
                    print("Local version is newer than API version")
                case .orderedSame:
                    print("Local version is the same as API version")
                }
            }
            
        }
    }
    @IBAction func buttonMath(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "CalculatorView", bundle: Bundle.main)
        let calculatorView = mainStoryboard.instantiateViewController(withIdentifier: "CalculatorView") as! CalculatorViewController
        navigationController?.pushViewController(calculatorView, animated: true)
    }
    
    @IBAction func buttonConvert(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "ConvertView", bundle: Bundle.main)
        let calculatorView = mainStoryboard.instantiateViewController(withIdentifier: "ConvertID") as! ConvertViewController
        navigationController?.pushViewController(calculatorView, animated: true)
    }
    
    @IBAction func buttonMoney(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "MoneyView", bundle: Bundle.main)
        let calculatorView = mainStoryboard.instantiateViewController(withIdentifier: "MoneyID") as! MoneyViewController
        navigationController?.pushViewController(calculatorView, animated: true)
    }
    
    @IBAction func buttonSide(_ sender: Any) {
        var viewController: ViewController = ViewController()
        viewController.sideMenuState(expanded: true)
    }
    
    func compareVersions(localVersion: String, apiVersion: String) -> ComparisonResult {
        let localComponents = localVersion.split(separator: ".")
        let apiComponents = apiVersion.split(separator: ".")
        
        // Kiểm tra xem cả hai phiên bản có cùng số lượng phần số không
        guard localComponents.count == apiComponents.count else {
            return .orderedSame
        }
        
        for (local, api) in zip(localComponents, apiComponents) {
            // Chuyển đổi thành số nguyên để so sánh
            if let localInt = Int(local), let apiInt = Int(api) {
                if localInt < apiInt {
                    return .orderedAscending
                } else if localInt > apiInt {
                    return .orderedDescending
                }
            } else {
                // Nếu không thể chuyển đổi thành số nguyên, trả về .orderedSame
                return .orderedSame
            }
        }
        
        // Nếu không có sự khác biệt, trả về .orderedSame
        return .orderedSame
    }
    
}
