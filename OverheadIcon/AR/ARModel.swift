//
//  ARModel.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/13/23.
//

import Foundation
import RealityKit

struct ARModel {
    private(set) var arView: ARView
    
    init() {
        arView = ARView(frame: .zero)
    }
}
