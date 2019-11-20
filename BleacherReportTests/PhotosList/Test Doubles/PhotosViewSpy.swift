//
//  PhotosViewSpy.swift
//  BleacherReportTests
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation
@testable import BleacherReport


class PhotosViewSpy: PhotosViewProtocol {
    private(set) var didCallShowError = false
    private(set) var didCallReloadView = false
    private(set) var errorTitle: String!
    private(set) var errorMessage: String!

    func showLoader() {
        //
    }
    func hideLoader() {
        //
    }

    func showError(title: String, message: String?) {
        self.didCallShowError = true
        self.errorTitle = title
        self.errorMessage = message
    }

    func reloadView() {
        self.didCallReloadView = true
    }
}
