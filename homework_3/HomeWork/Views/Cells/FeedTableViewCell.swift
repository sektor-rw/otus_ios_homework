//
//  FeedTableViewCell.swift
//  HomeWork
//
//  Created by Kolya on 18/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(title: String, color: UIColor) {
        self.title.text = title
        self.backgroundColor = color
    }
    
}
