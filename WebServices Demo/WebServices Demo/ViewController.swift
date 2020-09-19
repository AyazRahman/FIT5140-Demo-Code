//
//  ViewController.swift
//  WebServices Demo
//
//  Created by Ayaz Rahman on 9/9/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblResults: UILabel!
    
    // DataSource URL
    let jsonURL = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    @IBAction func btnGetData(_ sender: Any) {
        let task = URLSession.shared.dataTask(with: jsonURL!){
            (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            // process the response
            do{
                let decoder = JSONDecoder()
                
                let personData = try decoder.decode([Person].self, from: data!)// you have a swift object
                
                DispatchQueue.main.async {
                    self.lblResults.text = "\(personData[2].toString())"
                }
            } catch let err {
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

