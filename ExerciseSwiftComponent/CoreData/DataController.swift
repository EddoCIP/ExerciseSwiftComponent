//
//  DataController.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 29/04/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // Controller buat save and read persistent data (in memory)
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
