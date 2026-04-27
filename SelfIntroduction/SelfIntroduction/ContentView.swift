//
//  ContentView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        GeometryReader { geometry in
            MainTabView()
        }
    }
}

#Preview {
    ContentView()
}
