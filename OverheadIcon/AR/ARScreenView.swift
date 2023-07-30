//
//  ARScreenView.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/22/23.
//

import Foundation
import SwiftUI

struct ARScreenView: View {
    var arModel : ARModel = ARModel()
    
    let SWITCH_CAMERA_ICON_CODE = "arrow.triangle.2.circlepath.camera.fill"
    
    var body: some View {
        let arViewContainer = ARViewContainer(arModel: arModel)
        return VStack(alignment: .trailing) {
            HStack(alignment: .center) {
                Button {
                    arViewContainer.printAnchors()
                } label: {
                    Label("Check anchors", systemImage: "capsule.portrait")
                }.padding(.all)
                    .buttonStyle(.borderedProminent)
                Button {
                    arViewContainer.switchCamera()
                } label: {
                    Label("Switch Camera", systemImage: SWITCH_CAMERA_ICON_CODE)
                }.padding(.all)
                    .buttonStyle(.borderedProminent)
            }
            ZStack {
                arViewContainer
                    .border(.ultraThinMaterial, width: 5.0)
                    .onTapGesture(coordinateSpace: .local) { location in
                
                        arViewContainer.loadAnchor(atLocation: location)
                    }
//                Circle()
//                    .fill()
//                    .frame(width: 50, height: 50)
//                    .position(circlePoints[0])
            }
            
        }
    }
}
