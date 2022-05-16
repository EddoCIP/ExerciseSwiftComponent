//
//  HalfSheetModal.swift
//  ExerciseSwiftComponent
//  https://www.youtube.com/watch?v=rQKT7tn4uag
//  Created by Eddo Careera Iriyanto Putra on 16/05/22.
//

import SwiftUI

struct HalfSheetModal: View {
    var body: some View {
        Home()
    }
}

struct HalfSheetModal_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheetModal()
    }
}

struct Home: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            Button {
                showSheet = true
            } label: {
                Text("Present Sheet")
            }
            .navigationTitle("Half Modal Sheet")
            .halfSheet(showSheet: $showSheet) {
                ZStack {
                    Color.red
                }
                .ignoresSafeArea()
            }
        }
    }
}

extension View {
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()-> SheetView) -> some View {
        
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet)
            )
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    let controller = UIViewController()
    
    @Binding var showSheet: Bool
    
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            let sheetController = CustomHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
            
            
            presentationController.prefersGrabberVisible = true
            presentationController.largestUndimmedDetentIdentifier = .medium
        }
    }
}
