//
//  TimeManager.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/17.
//

import Foundation

class TimeManager: ObservableObject {
    let formatter = DateFormatter()
    var currentDate: Date
    @Published var timeArray: [Character] = [] // ["H", "H", ":", "m", "m", ":", "s", "s"]
    @Published var dateArray: [String] = [] // ["yyyy", "MM", "dd", "dddd"]
    var timer: Timer?

    init() {
        currentDate = Date()
        formatter.dateFormat = "yyyy-MM-dd/HH:mm:ss" // yyyy-MM-dd/HH:mm:ss
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateDate()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    func updateDate() {
        currentDate = Date()
        let timeString = formatter.string(from: currentDate)
        let date = timeString.components(separatedBy: "/")
        timeArray = Array(date[1])

        dateArray = date[0].components(separatedBy: "-")
        dateArray.append(currentDate.formatted(Date.FormatStyle().weekday(.abbreviated)))
//        print("\(dateArray) \(timeArray)") // ["2024", "07", "17", "Wed"] ["2", "2", ":", "2", "9", ":", "3", "6"]
    }

    deinit {
        timer?.invalidate()
    }
}
