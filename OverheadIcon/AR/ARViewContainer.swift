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
    var arModel: ARModel
    
    func makeUIView(context: Context) -> ARView {
        
        return arModel.asView()
    }
    
    func loadAnchor() {
        // Load the "Cone" scene from the "Experience" Reality File
        let coneAnchor = try! Experience.loadCone()
        
        // Add the cone anchor to the scene
        arModel.addAnchor(coneAnchor)
    }
    
    func switchCamera() {
        
        arModel.switchCamera()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
