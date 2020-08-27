//
//  SuperHero+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Ayaz Rahman on 27/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//
//

import Foundation
import CoreData


extension SuperHero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SuperHero> {
        return NSFetchRequest<SuperHero>(entityName: "SuperHero")
    }

    @NSManaged public var name: String?
    @NSManaged public var ability: String?
    @NSManaged public var teams: NSSet?

}

// MARK: Generated accessors for teams
extension SuperHero {

    @objc(addTeamsObject:)
    @NSManaged public func addToTeams(_ value: Team)

    @objc(removeTeamsObject:)
    @NSManaged public func removeFromTeams(_ value: Team)

    @objc(addTeams:)
    @NSManaged public func addToTeams(_ values: NSSet)

    @objc(removeTeams:)
    @NSManaged public func removeFromTeams(_ values: NSSet)

}
