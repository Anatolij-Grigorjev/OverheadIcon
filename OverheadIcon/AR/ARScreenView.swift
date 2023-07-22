//
//  ARScreenView.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/22/23.
//

import Foundation
import SwiftUI

struct ARScreenView: View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    
    let SWITCH_CAMERA_ICON_CODE = "arrow.triangle.2.circlepath.camera.fill"
    
    var body: some View {
        let arViewContainer = ARViewContainer(arViewModel: arViewModel)
        return VStack(alignment: .trailing) {
            HStack(alignment: .center) {
                Button {
                    arViewContainer.loadAnchor()
                } label: {
                    Label("Load anchor", systemImage: "capsule.portrait")
                }.padding(.all)
                    .buttonStyle(.borderedProminent)
                Button {
                    arViewContainer.switchCamera()
                } label: {
                    Label("Switch Camera", systemImage: SWITCH_CAMERA_ICON_CODE)
                }.padding(.all)
                    .buttonStyle(.borderedProminent)
            }
            arViewContainer
                .border(.ultraThinMaterial, width: 5.0)
                .onTapGesture(coordinateSpace: .local) { location in
                    print("tap is at \(location)")
                }
        }
    }
}
