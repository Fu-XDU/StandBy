//
//  ContentView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            FloatView()
        }
    }
}

#Preview {
    ContentView()
}
