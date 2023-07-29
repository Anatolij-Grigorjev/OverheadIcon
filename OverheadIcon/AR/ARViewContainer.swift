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
    
    func loadAnchor(atLocation location: CGPoint? = nil) {
        
        guard location != nil, let tappedAnchor = arModel.findAnchor(atLocation: location!) else {
            print("No anchors found active at tap location \(String(describing: location))")
            return
        }
        
        // Load the "Cone" scene from the "Experience" Reality File
        let floatingConeEntity = try! Experience.loadCone()
        
        arModel.addAnchored(atAnchor: tappedAnchor, entity: floatingConeEntity)
    }
    
    func printAnchors() {
        arModel.printAnchors()
    }
    
    func switchCamera() {
        
        arModel.switchCamera()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
