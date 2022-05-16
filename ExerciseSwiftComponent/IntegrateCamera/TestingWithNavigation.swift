//
//  TestingWithNavigation.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 03/05/22.
//

import SwiftUI

struct TestingWithNavigation: View {
    @State private var showImagePicker: Bool = false
    @State var isShow : Bool = false
    @State var image: Image? = nil
    var body: some View {
        NavigationView {
            NavigationLink(destination: PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)) {
                Text("test")
            }
        }
    }
}

struct TestingWithNavigation_Previews: PreviewProvider {
    static var previews: some View {
        TestingWithZStack(isPreview: true)
    }
}
