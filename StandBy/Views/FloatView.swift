//
//  FloatView.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/14.
//

import SwiftUI

class TimeManager: ObservableObject {
    @Published var currentTime: Date = Date()
    @Published var timeArray: [Character] = []
    var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.currentTime = Date()
            self.timeArray = self.getFormattedTime()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    func getFormattedTime() -> [Character]  {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // HH:mm:ss
        let timeString = formatter.string(from: currentTime)
        
        return Array(timeString)
    }

    deinit {
        timer?.invalidate()
    }
}

struct FloatView: View {
    @StateObject private var timeManager = TimeManager()
    #if os(watchOS)
     var width:CGFloat = 200
    #elseif os(iOS)
     var width:CGFloat = UIScreen.main.bounds.width
     var height:CGFloat = UIScreen.main.bounds.height
    #elseif os(macOS)
     var width:CGFloat = 200
    #endif
    private var font_family = "SF Pro Rounded"
    @State private var currentTime = Date()
    @State private var timeArray: [Character] = []
    @State private var style = "Float"
    @State private var color = "Blue"
    var body: some View {
        if !timeManager.timeArray.isEmpty {
            HStack{
                Text("\(String(timeManager.timeArray[0]))")
                    .foregroundStyle(Color("\(colorSetPrefix())/1"))
                    .rotationEffect(.degrees(-7))
                    .opacity(0.75)
                    .padding(.trailing, -70)
                    .zIndex(3)
                Text("\(String(timeManager.timeArray[1]))")
                    .foregroundStyle(Color("\(colorSetPrefix())/2"))
                    .rotationEffect(.degrees(-5))
                    .padding(.trailing, -70)
                    .zIndex(2)
                Text("\(String(timeManager.timeArray[2]))")
                    .foregroundStyle(Color("\(colorSetPrefix())/colon"))
                    .padding(.trailing, -70)
                    .offset(CGSize(width: 0.0, height: -20.0))
                    .opacity(0.98)
                    .zIndex(2)
                Text("\(String(timeManager.timeArray[3]))")
                    .foregroundStyle(Color("\(colorSetPrefix())/1"))
                    .rotationEffect(.degrees(5))
                    .opacity(0.75)
                    .padding(.trailing, -70)
                    .zIndex(1)
                Text("\(String(timeManager.timeArray[4]))")
                    .foregroundStyle(Color("\(colorSetPrefix())/2"))
                    .padding(.trailing, -70)
                    .zIndex(0)
            }
            .font(.custom(font_family, size: getFontSize()))
            .frame(width: width,height: height)
            .padding(.trailing, 70)
            .padding(.top,21)
            .contentTransition(.numericText(countsDown: true))
            .animation(.spring(duration: 1),value: timeManager.timeArray)
            .scaleEffect(x: 1.07, y: 1.1)
            .background(Color.black)
            .ignoresSafeArea()
        }
            
    }
    
    func colorSetPrefix() -> String  {
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
    func getFontSize() -> CGFloat  {
        return 0.0002613*width*width - 0.2377 * width + 344.1429
    }
    
    
}

#Preview {
    FloatView()
}
