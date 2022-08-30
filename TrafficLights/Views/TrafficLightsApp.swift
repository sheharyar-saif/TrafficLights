//
//  TrafficLightsApp.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 26/08/2022.
//

import SwiftUI

@main
struct TrafficLightsApp: App {
    
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.persistentContainer.viewContext)
        }
    }
}
