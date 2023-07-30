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
    var tapLocation: CGPoint = .zero
    
    init() {
        arView = ARView(frame: .zero)
    }
    
    func asView() -> ARView {
        return arView
    }
    
    func addAnchored(_ anchoredEntity: HasAnchoring) {
        arView.scene.addAnchor(anchoredEntity)
    }
    
    func addAnchored(atAnchor anchor: HasAnchoring, entity: HasAnchoring) {
        arView.scene.anchors.first(where: { anchor.id == $0.id })?.addChild(entity)
    }
    
    func printAnchors() {
        let anchors = arView.scene.anchors
        print("Num anchors: \(anchors.count)")
        print("Anchors: \(anchors.map { dump($0) })")
    }
    
    func findAnchor(atLocation location: CGPoint) -> HasAnchoring? {
        let locationTests = arView.hitTest(location)
        print("Hits at location: \(locationTests.count)")
        let foundAnchor = locationTests.first(where: { $0.entity is AnchorEntity })
    
        return foundAnchor?.entity as? AnchorEntity
    }
    
    func switchCamera() {
        guard let currentSesionConfig = arView.session.configuration else {
            fatalError("Could not fetch session configuration! Running in emulator?")
        }
        
        let nextConfig = oppositeCameraConfig(currentSesionConfig)
        
        arView.session.run(nextConfig, options: [.resetTracking, .removeExistingAnchors])
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
