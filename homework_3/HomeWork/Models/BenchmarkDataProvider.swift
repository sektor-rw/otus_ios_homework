//
//  BenchmarkDataProvider.swift
//  HomeWork
//
//  Created by Kolya on 20/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

protocol BenchmarkDataProvider {
    func getTimers() -> [TimerCellViewModel]
    @discardableResult func createNewTimer() -> TimerCellViewModel
    func getTimer(ind: Int) -> TimerCellViewModel?
    func resetToInitialState()
    func removeAll()
    func save()
}

class DefaultBenchmarkDataProvider: BenchmarkDataProvider {
    private var data: [TimerCellViewModel] = []
        
    func getTimers() -> [TimerCellViewModel] {
        return data
    }
    
    @discardableResult func createNewTimer() -> TimerCellViewModel {
        let newTimerModel = DefaultTimerCellViewModel()
        data.append(newTimerModel)
        return newTimerModel
    }
    
    func getTimer(ind: Int) -> TimerCellViewModel? {
        if ind >= data.count {
            return nil
        }
        return data[ind]
    }
    
    func resetToInitialState() {
        data.forEach { viewModel in
            viewModel.resetToInitialState()
        }
    }
    
    func removeAll() {
        data.forEach { viewModel in
            viewModel.stopTimer()
        }
        data.removeAll()
    }
    
    func save() {
        // TODO: not implemented
    }
}
