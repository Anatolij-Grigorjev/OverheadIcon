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

    var body: some View {
        if (drawARView.handoverButtonPressed) {
            ARScreenView()
        } else {
            SplashScreenView(startPressed: drawARView)
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
