//
//  MainScreenView.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 16/05/22.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        ZStack {
            HomeView()
            
            BottomSheet()
                .zIndex(1)
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
