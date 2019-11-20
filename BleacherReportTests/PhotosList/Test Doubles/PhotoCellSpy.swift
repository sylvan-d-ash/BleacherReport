//
//  PhotoCellSpy.swift
//  BleacherReportTests
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation
@testable import BleacherReport


class PhotoCellSpy: PhotoCellProtocol {
    private(set) var didCallDisplayTitle = false
    private(set) var didCallDisplayImage = false
    private(set) var title: String!
    private(set) var imageURL: URL!

    func display(title: String) {
        self.didCallDisplayTitle = true
        self.title = title
    }

    func display(image imageURL: URL) {
        self.didCallDisplayImage = true
        self.imageURL = imageURL
    }
}
