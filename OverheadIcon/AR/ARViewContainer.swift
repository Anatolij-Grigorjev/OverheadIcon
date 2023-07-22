//
//  ARViewContainer.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/13/23.
//

import Foundation
import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    var arView: ARView {
        
        get { return arViewModel.view }
    }
    
    
    func makeUIView(context: Context) -> ARView {
        
        return arView
    }
    
    func loadAnchor() {
        // Load the "Cone" scene from the "Experience" Reality File
        let coneAnchor = try! Experience.loadCone()
        
        // Add the cone anchor to the scene
        arView.scene.addAnchor(coneAnchor)
        
    }
    
    func switchCamera() {
        
        arViewModel.switchCamera()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
