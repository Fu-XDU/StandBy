//
//  TimeManager.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/17.
//

import Foundation

class TimeManager: ObservableObject {
    let formatter = DateFormatter()
    var currentDate = Date()
    @Published var timeArray: [Character] = [] // ['H', 'H', 'm', 'm', 's', 's']
    @Published var dateArray: [String] = [] // ["yyyy","MM","dd","dddd"]
    var timer: Timer?

    init() {
        formatter.dateFormat = "yyyy-MM-dd/HH:mm:ss" // yyyy-MM-dd/HH:mm:ss
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.currentDate = Date()
            let timeString = self.formatter.string(from: self.currentDate)
            let date = timeString.components(separatedBy: "/")
            self.dateArray = date[0].components(separatedBy: "-")
            self.timeArray = Array(date[1])
            self.dateArray.append(self.currentDate.formatted(Date.FormatStyle().weekday(.abbreviated)))
//            print("\(self.dateArray) \(self.timeArray)") // ["2024", "07", "17", "Wed"] ["2", "2", ":", "2", "9", "3", "6"]
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    deinit {
        timer?.invalidate()
    }
}
