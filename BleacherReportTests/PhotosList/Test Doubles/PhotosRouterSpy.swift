//
//  PhotosRouterSpy.swift
//  BleacherReportTests
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation
@testable import BleacherReport


class PhotosRouterSpy: PhotosRouterProtocol {
    private(set) var didCallShowFullPreview = false
    private(set) var photo: FlickrPhoto!

    func showFullPreview(for photo: FlickrPhoto) {
        self.didCallShowFullPreview = true
        self.photo = photo
    }
}
