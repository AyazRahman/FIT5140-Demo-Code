//
//  ViewController.swift
//  Week 1
//
//  Created by Ayaz Rahman on 6/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // References to UI Elements
    @IBOutlet weak var newText: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    
    @IBAction func button(_ sender: Any) {
        
        newText.text = "New Text"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Called before doing a segue.
    // Put all your setup code here for the destination viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigate"{
            let destination = segue.destination as! NewViewController
            // Check if the text is nil or empty
            guard let text = editTextField.text, editTextField.text != "" else {return}
            // Initialize the variables for the destination viewcontroller
            destination.delegate = self
            destination.data = text
        }
    }


}

extension ViewController: SendBackDelegate{
    // Function implemented to conform to the protocol
    func sendBack(data: String) {
        // When data is passed it should update the newText label
        //print("sendBack running in View Controller")
        newText.text = data
    }
}

