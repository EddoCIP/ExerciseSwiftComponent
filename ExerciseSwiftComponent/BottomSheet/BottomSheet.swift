//
//  BottomSheet.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 16/05/22.
//

import SwiftUI

struct BottomSheet: View {
    @State private var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Text("Cards")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.brown)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded{ value in
                        withAnimation(.easeInOut) {
                            let snap = translation.height + offsetY
                            let percentile = proxy.size.height / 10
                            
                            if snap > percentile * 2 {
                                offsetY = percentile * 4
                            } else {
                                offsetY = 0
                            }
                            
                            translation = .zero
                        }
                    }
            )
        .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
            .background(.blue)
    }
}
