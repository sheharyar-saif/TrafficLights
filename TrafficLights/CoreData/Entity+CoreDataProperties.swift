//
//  Entity+CoreDataProperties.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 29/08/2022.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }
    @NSManaged public var eventname: String?
    @NSManaged public var timestamp: Date?
}

extension History : Identifiable {

}
