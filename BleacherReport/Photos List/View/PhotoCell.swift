//
//  PhotoCell.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Kingfisher
import UIKit


protocol PhotoCellProtocol {
    func display(title: String)
    func display(image imageURL: URL)
}


class PhotoCell: UITableViewCell {
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
}


extension PhotoCell: PhotoCellProtocol {
    func display(title: String) {
        self.titleLabel.text = title
    }

    func display(image imageURL: URL) {
        self.thumbnailImageView.kf.indicatorType = .activity
        self.thumbnailImageView.kf.setImage(with: imageURL)
    }
}
