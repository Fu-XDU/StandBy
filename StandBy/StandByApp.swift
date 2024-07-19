//
//  StandByApp.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/12.
//

import SwiftUI

var shortcutItemToProcess: UIApplicationShortcutItem?

@main
struct StandByApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    @Environment(\.scenePhase) var phase

    @State private var selectedView: Int = 0

    var body: some Scene {
        WindowGroup {
            #if os(macOS)
                ContentView(selected: $selectedView).frame(minWidth: 720, maxWidth: .infinity, minHeight: 320, maxHeight: .infinity, alignment: .center)
            #else
                ContentView(selected: $selectedView).persistentSystemOverlays(.hidden)
            #endif
        }.onChange(of: phase) { newPhase in
            if newPhase == .active {
                guard let index = shortcutItemToProcess?.userInfo?["Index"] as? Int else {
                    return
                }
                selectedView = index
            }
        }
    }
}
