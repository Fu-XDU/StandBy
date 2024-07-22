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
            ContentView(selected: $selectedView).prefersPersistentSystemOverlaysHidden()
        }.onChange(of: phase) { newPhase in
            if newPhase == .active {
                guard let index = shortcutItemToProcess?.userInfo?["Index"] as? Int else {
                    return
                }
                
                shortcutItemToProcess = nil
                selectedView = index
            }
        }
    }
}
