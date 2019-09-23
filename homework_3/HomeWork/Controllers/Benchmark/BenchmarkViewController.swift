//
//  BenchmarkViewController.swift
//  HomeWork
//
//  Created by Kolya on 15/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {
    
    enum CollectionLayout: CaseIterable {
        case table
        case grid
        case stag
    }
    
    @IBOutlet weak var benchmarkCollectionView: UICollectionView!
    
    private let cellId = "\(BenchmarkCollectionViewCell.self)"
    private var dataProvider: BenchmarkDataProvider = DefaultBenchmarkDataProvider()
    
    private var curLayout: CollectionLayout = .grid {
        didSet {
            updateLayout()
        }
    }
    private var layouts: [CollectionLayout: UICollectionViewLayout] =
        [
            .table: GridLayout(numberOfColumns: 1),
            .grid: GridLayout(numberOfColumns: 2),
            .stag: StagLayout(
                widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 1.5), (0.5, 1.0)],
                itemSpacing: 4
            )
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        benchmarkCollectionView.register(UINib(nibName: cellId, bundle: nil),
                                         forCellWithReuseIdentifier: cellId)
        benchmarkCollectionView.dataSource = self
        benchmarkCollectionView.delegate = self
        guard let layout = layouts[curLayout] else { return }
        benchmarkCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dataProvider.resetToInitialState()
        benchmarkCollectionView.reloadData()
        super.viewWillDisappear(animated)
    }
    
    @IBAction func editAction(_ sender: Any) {
        self.showAlert("", message: "", style: .actionSheet, actions: [
            (
                "Remove all timers",
                .default,
                { [unowned self] in
                    self.removeAllElements()
                }
            ),
            (
                "Next layout",
                .default,
                { [unowned self] in
                    self.nextLayout()
                }
            )
        ])
    }
    
    @IBAction func addNewTimer(_ sender: Any) {
        dataProvider.createNewTimer()
        benchmarkCollectionView.insertItems(at: [IndexPath(row: dataProvider.getTimers().count - 1, section: 0)])
    }
    
    private func removeAllElements() {
        self.dataProvider.removeAll()
        self.benchmarkCollectionView.reloadData()
    }
    
    private func updateLayout() {
        guard let layout = layouts[curLayout] else { return }
        benchmarkCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func nextLayout() {
        let allCases = CollectionLayout.allCases
        guard let index = allCases.firstIndex(of: curLayout) else { return }
        let nextIndex = (index + 1) % allCases.count
        curLayout = allCases[nextIndex]
    }
}

// MARK: UICollectionViewDataSource

extension BenchmarkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.getTimers().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                            for: indexPath) as? BenchmarkCollectionViewCell else {
            fatalError("Wrong cell")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let viewModel = dataProvider.getTimer(ind: indexPath.row)
        cell.backgroundColor = viewModel?.bgColor
        viewModel?.delegate = cell as? TimeChangeDelegate
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let viewModel = dataProvider.getTimer(ind: indexPath.row)
        viewModel?.delegate = nil
    }
}

// MARK: UICollectionViewDelegate

extension BenchmarkViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewModel = dataProvider.getTimer(ind: indexPath.row)
        viewModel?.toogleTimer()
    }
}


