//
//  PhotosViewController.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import UIKit


class PhotosViewController: UIViewController {

    // MARK: - Properties

    var presenter: PhotosPresenterProtocol!

    // MARK: - IBOutlets

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        PhotosConfig(view: self)
        self.presenter.viewDidLoad()
    }

    // MARK: - Setup

    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}


extension PhotosViewController: PhotosViewProtocol {
    func showLoader() {
        //
    }

    func hideLoader() {
        //
    }
}


extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}


extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelect(itemAt: indexPath.row)
    }
}
