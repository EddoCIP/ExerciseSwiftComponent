//
//  TestingWithVStack.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 03/05/22.
//

import SwiftUI

struct TestingWithVStack: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var notes: String = ""
    
    var body: some View {
        VStack {
            if self.showImagePicker {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image )
                TextField("Add Notes", text: self.$notes)
            } else {
                Text(notes)
                image?.resizable()
                    .scaledToFit()
                Button("Open Camera") {
                    self.showImagePicker = true
                }
                .padding()
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct TestingWithVStack_Previews: PreviewProvider {
    static var previews: some View {
        TestingWithVStack()
    }
}
