//
//  ARModel.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/13/23.
//

import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView: ARView
    
    init() {
        arView = ARView(frame: .zero)
    }
    
    func asView() -> ARView {
        return arView
    }
    
    func addAnchor(_ anchor: HasAnchoring) {
        arView.scene.addAnchor(anchor)
    }
    
    func switchCamera() {
        guard let currentSesionConfig = arView.session.configuration else {
            fatalError("Could not fetch session configuration! Running in emulator?")
        }
        
        let nextConfig = oppositeCameraConfig(currentSesionConfig)
        
        arView.session.run(nextConfig)
    }
    
    fileprivate func oppositeCameraConfig(_ currentCameraConfig: ARConfiguration) -> ARConfiguration {
        switch currentCameraConfig {
        case is ARWorldTrackingConfiguration:
            return ARFaceTrackingConfiguration()
        case is ARFaceTrackingConfiguration:
            return ARWorldTrackingConfiguration()
        default:
            print("!!!Unrecognized config: \(currentCameraConfig)!!!")
            return ARWorldTrackingConfiguration()
        }
    }
    
}
