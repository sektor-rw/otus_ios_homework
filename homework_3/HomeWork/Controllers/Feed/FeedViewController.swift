//
//  FeedViewController.swift
//  HomeWork
//
//  Created by Kolya on 18/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    let dataProvider = DefaultFeedDataProvider().getFeeds()
    private let cellId = "\(FeedTableViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.register(UINib(nibName: cellId, bundle: nil),
                               forCellReuseIdentifier: cellId)
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }
    
    private func showSessionSummary(bgColor: UIColor) {
        let storyboard = UIStoryboard.init(storyboard: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: SessionSummaryViewController.storyboardIdentifier)
        viewController.view.backgroundColor = bgColor
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        let item = dataProvider[indexPath.section].items[indexPath.row]
        cell.update(title: item.title,
                    color: item.color)
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = dataProvider[indexPath.section].items[indexPath.row]
        showSessionSummary(bgColor: item.color)
    }
}
