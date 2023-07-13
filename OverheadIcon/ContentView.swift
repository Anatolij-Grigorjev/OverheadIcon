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
        VStack {
            Text("Hello AR World!").bold()
            if (!drawArView) {
                Button("Begin AR Experience") {
                    drawArView = true;
                }.padding(.top)
                    .buttonStyle(.borderedProminent)
            } else {
                ARViewContainer(arViewModel: arViewModel).border(.ultraThinMaterial, width: 5.0)
            }
        }.padding()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
