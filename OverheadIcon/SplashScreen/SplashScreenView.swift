//
//  SplashScreenView.swift
//  OverheadIcon
//
//  Created by Anatolij Grigorjev on 7/21/23.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var startPressed: ViewHandoverData
    
    var body: some View {
        return VStack {
            Text("Hello AR World!").bold();
            Button {
                startPressed.handoverButtonPressed = true
            } label: {
                startARExerienceLabel()
            }.padding(.top)
                .buttonStyle(.borderedProminent);
        }
    }
    
    fileprivate func startARExerienceLabel() -> Label<Text, Image> {
        return Label("Start AR", systemImage: "cube.transparent")
    }
}
