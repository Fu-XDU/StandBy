//
//  ContentView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/12.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timeManagerObj = TimeManager()
    var views: [AnyView] {
        [
            AnyView(NumericalView(timeManager: timeManagerObj)),
            AnyView(FloatView(timeManager: timeManagerObj)),
        ]
    }

    var body: some View {
        VTabView(indexPosition: .leading) {
            ForEach(0 ..< views.count, id: \.self) { index in
                views[index]
            }
        }.onAppear(perform: {
            UIScrollView.appearance().clipsToBounds = false
        })
        .background(Color.black)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
