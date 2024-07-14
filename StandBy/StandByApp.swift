//
//  StandByApp.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/12.
//

import SwiftUI

@main
struct StandByApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView().frame(minWidth: 720, maxWidth: .infinity, minHeight: 320, maxHeight: .infinity, alignment: .center)
            #else
            ContentView().persistentSystemOverlays(.hidden)
            #endif
                
        }
    }
}
