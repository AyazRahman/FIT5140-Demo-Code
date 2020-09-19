//
//  DecoderClasses.swift
//  WebServices Demo
//
//  Created by Ayaz Rahman on 9/9/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import Foundation

class Person: NSObject, Decodable{
    var name: String
    var userName: String
    var email: String
    var address: Address
    
    private enum CodingKeys: String, CodingKey{
        case name
        case userName = "username"
        case email
        case address
    }
    
    
    func toString() -> String {
        return "{\nname: \(name)\nusername: \(userName)\nemial: \(email)\naddress: \(address.toString())\n}"
    }
}

class Address: NSObject, Decodable {
    var street: String
    var suite: String
    var city: String
    var zipCode: String
    var geo: Geo
    
    private enum CodingKeys: String, CodingKey{
        case street
        case suite
        case city
        case zipCode = "zipcode"
        case geo
    }
    
    func toString()->String{
        return "{\nstreet: \(street)\nsuite: \(suite)\ncity: \(city)\nzipCode: \(zipCode)\ngeo: \(geo.toString())\n}"
    }
}

class Geo: NSObject, Decodable {
    var lat: String
    var lon: String

    private enum CodingKeys: String, CodingKey{
        case lat
        case lon = "lng"
    }

    func toString()->String{
        return "{\nlat: \(lat)\nlon: \(lon)\n}"
    }
}
//struct Geo: Decodable{
//    var lat: String
//    var lng: String
//}
