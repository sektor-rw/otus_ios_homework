//
//  BenchmarkCollectionViewCell.swift
//  HomeWork
//
//  Created by Kolya on 18/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class BenchmarkCollectionViewCell: UICollectionViewCell, TimeChangeDelegate {
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var millisecondsLabel: UILabel!
    
    func updateTime(_ time: TimerTimeString) {
        minutesLabel.text = time.min
        secondsLabel.text = time.sec
        millisecondsLabel.text = time.ms
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
