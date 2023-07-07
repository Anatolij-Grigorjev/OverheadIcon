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
    var body: some View {
        VStack {
            Text("Hello AR World!").bold()
            if (!drawArView) {
                Button("Begin AR Experience") {
                    drawArView = true;
                }.padding(.top)
                    .buttonStyle(.borderedProminent)
            } else {
                ARViewContainer().border(.ultraThickMaterial, width: 5.0)
            }
        }.padding()
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Cone" scene from the "Experience" Reality File
        let coneAnchor = try! Experience.loadCone()
        
        // Add the cone anchor to the scene
        arView.scene.anchors.append(coneAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
