//
//  ContentCoreData.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 29/04/22.
//

import SwiftUI

struct ContentCoreData: View {
    @Environment(\.managedObjectContext) var moc
    // Fetch data from core data (Ga harus buat Struct Student karena sudah digenerate oleh coredata)
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["sadasd", "sadasd", "ewqeqwe"]
                let lastNames = ["sdads", "rerere", "ppppp"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentCoreData_Previews: PreviewProvider {
    static var previews: some View {
        ContentCoreData()
    }
}
