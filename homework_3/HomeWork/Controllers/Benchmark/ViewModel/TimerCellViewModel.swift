//
//  TimerCellViewModel.swift
//  HomeWork
//
//  Created by Kolya on 20/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

typealias TimerTimeString = (min: String, sec: String, ms: String)
typealias TimerTimeInt = (min: Int, sec: Int, ms: Int)

protocol TimeChangeDelegate: class {
    func updateTime(_ time: TimerTimeString)
}

protocol TimerCellViewModel: class {
    // TODO: can be optimized by stopping the timer and saving current time when the delegate becomes nil 
    var delegate: TimeChangeDelegate? { get set }
    var bgColor: UIColor { get }
    var currentTime: TimerTimeInt { get }
    
    func toogleTimer()
    func resetToInitialState()
    func stopTimer()
}

class DefaultTimerCellViewModel: TimerCellViewModel {
    weak var delegate: TimeChangeDelegate? {
        didSet {
            delegate?.updateTime(getTimerTime(currentTime))
        }
    }
    var bgColor: UIColor {
        return _bgColor
    }
    var currentTime: TimerTimeInt {
        return _currentTime
    }
    
    private var timer: Timer?
    private var _currentTime: TimerTimeInt
    private var _bgColor: UIColor
    
    deinit {
        stopTimer()
    }
    
    init(time: TimerTimeInt = (0, 0, 0),
         color: UIColor = UIColor.random) {
        _currentTime = time
        _bgColor = color
    }
    
    func toogleTimer() {
        if (timer == nil) {
            startTimer()
            return
        }
        stopTimer()
    }
    
    func resetToInitialState() {
        stopTimer()
        _currentTime = (0, 0, 0)
    }
    
    private func startTimer() {
        timer = Timer(timeInterval: 0.01, target: self, selector: #selector(timerTic(_:)), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func getTimerTime(_ time: TimerTimeInt) -> TimerTimeString {
        return (String(format: "%02d", time.min),
                String(format: "%02d", time.sec),
                String(format: "%02d", time.ms))
    }
    
    @objc private func timerTic(_ sender: Timer) {
        _currentTime.ms += 1
        if _currentTime.ms >= 100 {
            _currentTime.ms = 0
            _currentTime.sec += 1
        }
        if _currentTime.sec >= 60 {
            _currentTime.min += 1
            _currentTime.sec = 0
        }
        let newTime = getTimerTime(_currentTime)
        delegate?.updateTime(newTime)
    }
}
