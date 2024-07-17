//
//  NumericalView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/17.
//

import SwiftUI

struct NumericalView: View {
    @ObservedObject var timeManager: TimeManager
    var width: CGFloat = UIScreen.main.bounds.width

    @State private var style = "Numerical"
    @State private var color = "Blue"
    let x_scale = CGFloat(0.9)
    let y_scale = CGFloat(1.7)
    let padding = CGFloat(-10)
    var body: some View {
        if !timeManager.timeArray.isEmpty {
            HStack {
                HStack {
                    Text("\(String(timeManager.timeArray[0]))")
                        .animation(.spring(duration: 1), value: timeManager.timeArray[0])
                        .scaleEffect(x: x_scale, y: y_scale)
                        .padding(.horizontal, padding)
                        .frame(minWidth: 120)
                    Text("\(String(timeManager.timeArray[1]))")
                        .animation(.spring(duration: 1), value: timeManager.timeArray[1])
                        .scaleEffect(x: x_scale, y: y_scale)
                        .padding(.horizontal, padding)
                        .frame(minWidth: 120)
                    Text("\(String(timeManager.timeArray[2]))")
                        .animation(.spring(duration: 1), value: timeManager.timeArray[2])
                        .scaleEffect(x: x_scale, y: y_scale)
                        .padding(.horizontal, padding)
                        .frame(minWidth: 40)
                        .offset(CGSize(width: 0.0, height: -20.0))
                    Text("\(String(timeManager.timeArray[3]))")
                        .animation(.spring(duration: 1), value: timeManager.timeArray[3])
                        .scaleEffect(x: x_scale, y: y_scale)
                        .padding(.horizontal, padding)
                        .frame(minWidth: 120)
                    Text("\(String(timeManager.timeArray[4]))")
                        .animation(.spring(duration: 1), value: timeManager.timeArray[4])
                        .scaleEffect(x: x_scale, y: y_scale)
                        .padding(.horizontal, padding)
                        .frame(minWidth: 120)
                }.font(.custom("SF Pro Text Semibold", size: 220))
                    .foregroundColor(Color("Styles/\(style)/\(color)"))
                    .padding(.leading, 30)
                    .padding()
                VStack {
                    HStack {
                        Text("\(timeManager.dateArray[2])").foregroundStyle(Color.white)
                        Text("\(timeManager.dateArray[3])").foregroundColor(Color("Styles/\(style)/\(color)"))
                    }.font(.custom("SF Pro Text Semibold", size: 27))
                    Spacer()
                }
                .padding(.top, 60)
                .padding(.leading, 10)

                Spacer()
            }

            .padding(.top, 21)
            .contentTransition(.numericText(countsDown: true))
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
    NumericalView(timeManager: TimeManager())
}
