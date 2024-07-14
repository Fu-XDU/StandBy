//
//  FloatView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/14.
//

import SwiftUI

struct FloatView: View {
    private var font_family = "SF Pro Rounded"
    @State private var currentTime = Date()
    @State private var timeArray: [Character] = []
    @State private var style = "Float"
    @State private var color = "Blue"
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            if !timeArray.isEmpty{
                HStack{
                    Text("\(String(timeArray[0]))")
                        .foregroundStyle(Color("\(colorSetPrefix())/1"))
                        .rotationEffect(.degrees(-7))
                        .opacity(0.75)
                        .padding(.trailing, -70)
                        .zIndex(3)
                    Text("\(String(timeArray[1]))")
                        .foregroundStyle(Color("\(colorSetPrefix())/2"))
                        .rotationEffect(.degrees(-5))
                        .padding(.trailing, -70)
                        .zIndex(2)
                    Text("\(String(timeArray[2]))")
                        .foregroundStyle(Color("\(colorSetPrefix())/colon"))
                        .padding(.trailing, -70)
                        .offset(CGSize(width: 0.0, height: -20.0))
                        .opacity(0.98)
                        .zIndex(2)
                    Text("\(String(timeArray[3]))")
                        .foregroundStyle(Color("\(colorSetPrefix())/1"))
                        .rotationEffect(.degrees(5))
                        .opacity(0.75)
                        .padding(.trailing, -70)
                        .zIndex(1)
                    Text("\(String(timeArray[4]))")
                        .foregroundStyle(Color("\(colorSetPrefix())/2"))
                        .padding(.trailing, -70)
                        .zIndex(0)
                }
                .font(.custom(font_family, size: 370))
                .padding(.trailing, 30)
            }
        }.onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                currentTime = Date()
                timeArray = getFormattedTime()
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    func getFormattedTime() -> [Character]  {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let timeString = formatter.string(from: currentTime)
        return Array(timeString)
    }
    
    func colorSetPrefix() -> String  {
        return "Styles/\(style)/\(color)"
    }
}

#Preview {
    FloatView()
}
