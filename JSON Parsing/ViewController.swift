//
//  ViewController.swift
//  JSON Parsing
//
//  Created by Rakhi on 25/01/19.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let dataResponse = data , error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse)
                self.parseJson(json: jsonResponse)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    
    func parseJson(json:Any){
        guard let jsonArray = json as? [[String: Any]] else {
            return
        }
        
        guard let title = jsonArray[0]["title"] as? String else { return }
        print(title)
        
    }
}

