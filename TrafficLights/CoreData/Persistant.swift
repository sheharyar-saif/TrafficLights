//
//  Persistant.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 30/08/2022.
//
import SwiftUI
import CoreData

class PersistenceController {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrafficLightsHistory")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
