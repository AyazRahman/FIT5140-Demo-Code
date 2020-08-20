//
//  SendBackProtocol.swift
//  Week 1
//
//  Created by Ayaz Rahman on 20/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import Foundation

protocol SendBackDelegate: AnyObject {
    func sendBack(data: String)
}
