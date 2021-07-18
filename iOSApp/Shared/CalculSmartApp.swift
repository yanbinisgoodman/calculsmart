//
//  CalculSmartApp.swift
//  Shared
//
//  Created by Micheau Bastien on 18/07/2021.
//

import SwiftUI

@main
struct CalculSmartApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
