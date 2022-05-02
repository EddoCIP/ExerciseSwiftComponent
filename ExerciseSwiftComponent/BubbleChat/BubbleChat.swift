//
//  BubbleChat.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 29/04/22.
//

import SwiftUI

struct BubbleChat: View {
    var height: CGFloat = 300
    var width: CGFloat = 300
    var difference: CGFloat = 30
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Triangle(isLeft: true).frame(width: self.width, height: self.height).foregroundColor(.blue)
//                .shadow(color: .black, radius: 10, x: 1, y: 1)
            Rectangle().frame(width: self.width, height: self.height - difference).cornerRadius(30).foregroundColor(.blue)
//                .shadow(color: .black, radius: 10, x: 1, y: 1)
        }
    }
}

struct Triangle: Shape {
    var isLeft: Bool = false
    
    func path(in rect: CGRect) -> Path {
        return rightDownTriangle(in: rect)
    }
    
    func rightDownTriangle(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + 30, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY - 30))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + 30, y: rect.minY))
        
        return path
    }
    
    func leftDownTriangle(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX - 30, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY - 30))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - 30, y: rect.minY))
        
        return path
    }
    
    func leftTopTriangle(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX - 30, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY - 30))
        path.addLine(to: CGPoint(x: rect.minX - 30 , y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX - 30, y: rect.minY))
        
        return path
    }
}

struct BubbleChat_Previews: PreviewProvider {
    static var previews: some View {
        BubbleChat()
    }
}
