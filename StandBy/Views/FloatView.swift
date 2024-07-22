//
//  FloatView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/14.
//

import SwiftUI

struct FloatView: View {
    @EnvironmentObject var timeManager: TimeManager

    var width: CGFloat = UIScreen.main.bounds.width
    var height: CGFloat = UIScreen.main.bounds.height

    @State private var style = "Float"
    @State private var color = "Blue"

    var body: some View {
        let timeArray = timeManager.timeArray

        if !timeArray.isEmpty {
            HStack {
                Text("\(String(timeArray[0]))")
                    .prefersForegroundColor(Color("\(colorSetPrefix())/1"))
                    .animation(.spring(duration: 1), value: timeArray[0])
                    .rotationEffect(.degrees(-7))
                    .opacity(0.75)
                    .padding(.trailing, -70)
                    .zIndex(3)
                Text("\(String(timeArray[1]))")
                    .prefersForegroundColor(Color("\(colorSetPrefix())/2"))
                    .animation(.spring(duration: 1), value: timeArray[1])
                    .rotationEffect(.degrees(-5))
                    .padding(.trailing, -70)
                    .zIndex(2)
                Text("\(String(timeArray[2]))")
                    .prefersForegroundColor(Color("\(colorSetPrefix())/colon"))
                    .animation(.spring(duration: 1), value: timeArray[2])
                    .padding(.trailing, -70)
                    .offset(CGSize(width: 0.0, height: -20.0))
                    .opacity(0.98)
                    .zIndex(2)
                Text("\(String(timeArray[3]))")
                    .prefersForegroundColor(Color("\(colorSetPrefix())/1"))
                    .animation(.spring(duration: 1), value: timeArray[3])
                    .rotationEffect(.degrees(5))
                    .opacity(0.75)
                    .padding(.trailing, -70)
                    .zIndex(1)
                Text("\(String(timeArray[4]))")
                    .prefersForegroundColor(Color("\(colorSetPrefix())/2"))
                    .animation(.spring(duration: 1), value: timeArray[4])
                    .padding(.trailing, -70)
                    .zIndex(0)
            }
            .font(.custom("SF Pro Rounded", size: getFontSize()))
            .padding(.trailing, 70)
            .padding(.top, 21)
            .prefersContentTransition()
            .scaleEffect(x: 1.07, y: 1.1)
            .background(Color.black)
            .ignoresSafeArea()
        }
    }

    func colorSetPrefix() -> String {
        return "Styles/\(style)/\(color)"
    }

    /*
     width   font_size
     667       320
     932       370
     1133      450
     1180      480
     1210      500
     1376      570
     */
    func getFontSize() -> CGFloat {
        return 0.0002613 * width * width - 0.2377 * width + 344.1429
    }
}

#Preview {
    FloatView().environmentObject(TimeManager())
}
