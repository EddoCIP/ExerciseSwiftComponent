//
//  TestingWithZStack.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 03/05/22.
//

import SwiftUI

struct TestingWithZStack: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var notes: String = ""
    var isPreview: Bool = false
    
    var body: some View {
        VStack {
            if self.showImagePicker {
                ZStack {
                    GeometryReader { geo in
                        PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image, isPreview: self.isPreview)
                        Image(systemName: "square.and.arrow.up.fill")
                            .resizable()
                            .frame(width: 300, height: 300)
                        // tinggal nyari cara biar bisa di pojok kiri bawah :D
                    }
                }
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

struct TestingWithZStack_Previews: PreviewProvider {
    static var previews: some View {
        TestingWithZStack(isPreview: true)
    }
}
