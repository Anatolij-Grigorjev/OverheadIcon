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
    
    func makeUIView(context: Context) -> ARView {
        
        let arView: ARView = arViewModel.view
        
        // Load the "Cone" scene from the "Experience" Reality File
        let coneAnchor = try! Experience.loadCone()
        
        // Add the cone anchor to the scene
        arView.scene.anchors.append(coneAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
