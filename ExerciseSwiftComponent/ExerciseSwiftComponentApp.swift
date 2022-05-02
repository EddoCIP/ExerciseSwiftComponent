//
//  ExerciseSwiftComponentApp.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 29/04/22.
//

import SwiftUI

@main
struct ExerciseSwiftComponentApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            //            inject core data context to environment
//            ContentCoreData().environment(\.managedObjectContext, dataController.container.viewContext)
//            SearchBarExample()
//            CameraComponent()
            IntegrateCameraView()
        }
    }
}
