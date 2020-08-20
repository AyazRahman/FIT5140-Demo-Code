//
//  NewViewController.swift
//  Week 1
//
//  Created by Ayaz Rahman on 13/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit

class NewViewController: ViewController {
    // variable for holding the data sent to second viewcontroller
    var data: String?
    // variable for holding a reference to the first viewcontroller as SendBackDelegate
    weak var delegate: SendBackDelegate?
    
    // Reference to UI Elements
    @IBOutlet weak var receivedLabel: UILabel!
    //Should send data back to first viewcontroller when clicked
    @IBAction func sendBackButton(_ sender: Any) {
        // check if the delegate is set by the first viewcontroller
        guard let delegate = self.delegate else {
            print("Delegate not initialized")
            return
        }
        // Call the protocol function to send the data back
        delegate.sendBack(data: (receivedLabel.text ?? "No Valid Text")+" sent back from second screen")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // check if the data is null or empty
        if let data = data, data != ""{
            receivedLabel.text = data
        }
        else{
            // Set the label text if we have valid data
            receivedLabel.text = "No valid value"
        }
    }

}
