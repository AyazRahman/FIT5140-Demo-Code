//
//  Category+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Ayaz Rahman on 26/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var animals: NSSet?

}

// MARK: Generated accessors for animals
extension Category {

    @objc(addAnimalsObject:)
    @NSManaged public func addToAnimals(_ value: Animal)

    @objc(removeAnimalsObject:)
    @NSManaged public func removeFromAnimals(_ value: Animal)

    @objc(addAnimals:)
    @NSManaged public func addToAnimals(_ values: NSSet)

    @objc(removeAnimals:)
    @NSManaged public func removeFromAnimals(_ values: NSSet)

}
