//
//  Animal+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Ayaz Rahman on 26/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }

    @NSManaged public var name: String?
    @NSManaged public var stamped: Bool
    @NSManaged public var count: Int16
    @NSManaged public var category: Category?

}
