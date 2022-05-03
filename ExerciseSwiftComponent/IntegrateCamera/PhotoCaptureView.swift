//
//  PhotoCaptureView.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 02/05/22.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    var isPreview: Bool = false
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image, isPreview: isPreview)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")), isPreview: true)
    }
}
