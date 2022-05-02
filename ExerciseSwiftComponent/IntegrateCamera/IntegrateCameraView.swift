//
//  IntegrateCameraView.swift
//  ExerciseSwiftComponent
//  https://www.youtube.com/watch?v=W60nnRFUGaI
//  Created by Eddo Careera Iriyanto Putra on 02/05/22.
//

import SwiftUI

struct IntegrateCameraView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            image?.resizable()
                .scaledToFit()
            Button("Open Camera") {
                self.showImagePicker = true
            }
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image )
        }
    }
}

struct IntegrateCameraView_Previews: PreviewProvider {
    static var previews: some View {
        IntegrateCameraView()
    }
}
