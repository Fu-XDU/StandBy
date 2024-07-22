//
//  ContentView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timeManager: TimeManager = TimeManager()
    @Binding var selected: Int

    var views: [AnyView] {
        [
            AnyView(NumericalView()),
            AnyView(FloatView()),
        ]
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VTabView(selection: $selected) {
                ForEach(0 ..< views.count, id: \.self) { index in
                    views[index]
                }
            }.onAppear(perform: {
                UIScrollView.appearance().clipsToBounds = false
                UIApplication.shared.isIdleTimerDisabled = true
            })
            .background(Color.black)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .environmentObject(timeManager)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var selected: Int = 0
        var body: some View {
            ContentView(selected: $selected)
        }
    }

    return Preview()
}
