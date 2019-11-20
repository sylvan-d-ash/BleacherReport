//
//  PhotoViewController.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Kingfisher
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

        // photo title
        self.titleLabel.text = photo.title

        // photo image
        let sizeThumbnail = "b"
        guard let url = URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_\(sizeThumbnail).jpg") else { return }
        self.photoImageView.kf.indicatorType = .activity
        self.photoImageView.kf.setImage(with: url)
    }

    // MARK: - IBActions

    @IBAction private func didTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
