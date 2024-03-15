//
//  MoneyViewController.swift
//  calculatorplus
//
//  Created by MacMini on 14/3/24.
//

import UIKit

class MoneyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchSomeData(from: "USD", to: "VND")
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchSomeData(from: String, to: String) {
        // Tạo URL cho API endpoint bạn muốn gọi
        let baseURL = "https://currency-exchange.p.rapidapi.com/exchange"
        let urlString = "\(baseURL)?from=\(from)&to=\(to)&Q=1.0"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        print(urlString)
        // Tạo URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Thêm header vào yêu cầu
        request.setValue("eeea5cd2d2msh21a7837efffc7a8p1a5317jsnb54b689dc1a3",
                         forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("currency-exchange.p.rapidapi.com",
                         forHTTPHeaderField: "X-RapidAPI-Host")
        
        // Tạo URLSession
        let session = URLSession.shared
        
        // Tạo yêu cầu GET
        let task = session.dataTask(with: request) { data, response, error in
            // Kiểm tra lỗi
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            
            guard let responseData = data else {
                print("No data received")
                return
            }
            
            // Xử lý dữ liệu trả về, ví dụ: chuyển đổi dữ liệu thành String
            if let responseBody = String(data: responseData, encoding: .utf8) {
                print("Response body: \(responseBody)")
            } else {
                print("Unable to convert data to String")
            }
        }
        
        // Bắt đầu task
        task.resume()
    }
    
}
