//
//  ContentView.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/6/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @StateObject var drawARView: ViewHandoverData = ViewHandoverData()
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()

    
    var body: some View {
        if (drawARView.handoverButtonPressed) {
            drawARViewScreen()
        } else {
            SplashScreenView(startPressed: drawARView)
        }
    }
    
    let SWITCH_CAMERA_ICON_CODE = "arrow.triangle.2.circlepath.camera.fill"
    
    fileprivate func drawARViewScreen() -> some View {
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
        }.onTapGesture(coordinateSpace: .local) { location in
                print("tap is at \(location)")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
