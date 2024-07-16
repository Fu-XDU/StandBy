//
//  ContentView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/12.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .blue, .green, .pink, .purple]
    var width:CGFloat = UIScreen.main.bounds.width
    var height:CGFloat = UIScreen.main.bounds.height
    
    
    @State private var selection = 0
        let views: [AnyView]

        init() {
            views = [
                AnyView(FloatView()),
                AnyView(FloatView()),
                AnyView(FloatView())
            ]
        }
    
    
    var body: some View {
            VTabView(indexPosition: .leading) {
                ForEach(0..<views.count, id: \.self) { index in
                    views[index]
                }
            }.onAppear(perform: {
                UIScrollView.appearance().clipsToBounds=false
            })
            .background(Color.gray)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
