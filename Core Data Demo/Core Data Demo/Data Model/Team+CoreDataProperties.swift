//
//  Team+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Ayaz Rahman on 27/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var name: String?
    @NSManaged public var superheros: NSSet?

}

// MARK: Generated accessors for superheros
extension Team {

    @objc(addSuperherosObject:)
    @NSManaged public func addToSuperheros(_ value: SuperHero)

    @objc(removeSuperherosObject:)
    @NSManaged public func removeFromSuperheros(_ value: SuperHero)

    @objc(addSuperheros:)
    @NSManaged public func addToSuperheros(_ values: NSSet)

    @objc(removeSuperheros:)
    @NSManaged public func removeFromSuperheros(_ values: NSSet)

}
