//
//  NumericalView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/17.
//

import SwiftUI

struct NumericalView: View {
    @ObservedObject var timeManager: TimeManager

    private let width: CGFloat = UIScreen.main.bounds.width
    private let style = "Numerical"
    @State private var color = "Blue"

    var body: some View {
        let timeArray = timeManager.timeArray
        let dateArray = timeManager.dateArray

        if !timeArray.isEmpty {
            HStack {
                Spacer()
                HStack {
                    Text("\(String(timeArray[0]))")
                    Spacer()
                    Text("\(String(timeArray[1]))")
                    Spacer()
                    Text("\(String(timeArray[2]))").offset(CGSize(width: 0.0, height: -45.0))
                    Text("\(String(timeArray[3]))")
                    Spacer()
                    Text("\(String(timeArray[4]))")
                }.animation(.spring(duration: 1), value: timeArray)
                    .font(.custom("AFCamberwell-One", size: getTimeFontSize()))
                    .foregroundColor(Color("Styles/\(style)/\(color)"))

                if !dateArray.isEmpty {
                    VStack {
                        HStack {
                            Text("\(dateArray[2])").foregroundStyle(Color.white)
                            Text("\(dateArray[3])").foregroundColor(Color("Styles/\(style)/\(color)"))
                        }.padding(.top, getPaddingTopSize())
                            .font(.system(size: getDateFontSize()))
                        Spacer()
                    }
                }

                Spacer()
            }
            .contentTransition(.numericText(countsDown: true))
            .background(Color.black)
            .ignoresSafeArea()
//            .onAppear(
//                perform: {
//                    print("\(width)")
//                }
//            )
        }
    }

    func colorSetPrefix() -> String {
        return "Styles/\(style)/\(color)"
    }

    func getTimeFontSize() -> CGFloat {
        let timeSizeDir: [CGFloat: CGFloat] = [
            852: 380, // iPhone 15 Pro
            932: 450, // iPhone 15 Pro Max
            1180: 680, // iPad Air 11-inch
            1210: 680, // iPad Pro 11-inch
            1366: 750, // iPad Air 13-inch
            1376: 750, // iPad Pro 13-inch
        ]
        return timeSizeDir[width] ?? 0.0002613 * width * width - 0.2377 * width + 344.1429
    }

    func getDateFontSize() -> CGFloat {
        let dateSizeDir: [CGFloat: CGFloat] = [
            852: 50, // iPhone 15 Pro
            932: 50, // iPhone 15 Pro Max
            1180: 70, // iPad Air 11-inch
            1210: 70, // iPad Pro 11-inch
            1366: 80, // iPad Air 13-inch
            1376: 80, // iPad Pro 13-inch
        ]
        return dateSizeDir[width] ?? 0.0002613 * width * width - 0.2377 * width + 344.1429
    }

    func getPaddingTopSize() -> CGFloat {
        let paddingTopDir: [CGFloat: CGFloat] = [
            852: 30, // iPhone 15 Pro
            932: 30, // iPhone 15 Pro Max
            1180: 120, // iPad Air 11-inch
            1210: 125, // iPad Pro 11-inch
            1366: 200, // iPad Air 13-inch
            1376: 205, // iPad Pro 13-inch
        ]

        return paddingTopDir[width] ?? 200
    }
}

#Preview {
    NumericalView(timeManager: TimeManager())
}
