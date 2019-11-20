//
//  PhotoViewController.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import UIKit


class PhotoViewController: UIViewController {

    // MARK: - Properties

    var photo: FlickrPhoto!

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = photo.title
        // TODO: add kingfisher
    }

    // MARK: - IBActions

    @IBAction private func didTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
