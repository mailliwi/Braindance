//
//  ContentView.swift
//  Braindance
//
//  Created by William Dupont on 03/10/2022.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    var body: some View {
        CardView(card: Card.example)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light).previewInterfaceOrientation(.landscapeLeft)
        ContentView().preferredColorScheme(.dark).previewInterfaceOrientation(.landscapeLeft)
    }
}

