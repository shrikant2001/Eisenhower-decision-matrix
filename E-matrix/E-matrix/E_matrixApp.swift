//
//  E_matrixApp.swift
//  E-matrix
//
//  Created by shrikant kamalakar jadhav on 02/11/21.
//

import SwiftUI

@main
struct E_matrixApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
