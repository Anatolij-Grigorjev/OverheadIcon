//
//  ContentView.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/6/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var drawArView = false
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()

    
    var body: some View {
        if (!drawArView) {
            drawSplashScreen()
        } else {
            drawARViewScreen()
        }
    }
    
    fileprivate func drawSplashScreen() -> some View {
        return VStack {
            Text("Hello AR World!").bold();
            Button {
                drawArView = true;
            } label: {
                Label("Start AR", systemImage: "cube.transparent")
            }.padding(.top)
                .buttonStyle(.borderedProminent);
        }
    }
    
    fileprivate func drawARViewScreen() -> some View {
        let arViewContainer = ARViewContainer(arViewModel: arViewModel)
        return VStack {
            HStack {
                Button {
                    arViewContainer.loadAnchor()
                } label: {
                    Label("Load anchor", systemImage: "capsule.portrait")
                }.padding(.all)
                    .buttonStyle(.borderedProminent)
                Button {
                    arViewContainer.switchCamera()
                } label: {
                    Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath.camera.fill")
                }.padding(.all)
                    .buttonStyle(.borderedProminent)
            }
            arViewContainer
                .border(.ultraThinMaterial, width: 5.0)
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
