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

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup dependencies
        PhotosConfig(view: self)

        // setup views
        self.setupTableView()

        // test search process
        self.presenter.viewDidLoad()
    }

    // MARK: - Setup

    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}


extension PhotosViewController: PhotosViewProtocol {
    func showLoader() {
        //
    }

    func hideLoader() {
        //
    }

    func showError(title: String, message: String?) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }

    func reloadView() {
        self.tableView.reloadData()
    }
}


extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // dequeue cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UITableViewCell()
        }

        // configure cell
        self.presenter.configure(cell, forRowAt: indexPath.row)

        return cell
    }
}


extension PhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelect(itemAt: indexPath.row)
    }
}
