//
//  ARViewModel.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/13/23.
//

import Foundation
import RealityKit

class ARViewModel: ObservableObject {
    @Published private var model: ARModel = ARModel()
    
    var view: ARView {
        get { model.arView }
    }
    
    func switchCamera() {
        model.switchCamera()
    }
}
