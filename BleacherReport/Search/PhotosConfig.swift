//
//  PhotosConfig.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


class PhotosConfig {
    @discardableResult
    init(view: PhotosViewController) {
        let interactor = PhotosInteractor(webService: WebService())
        let presenter = PhotosPresenter(view, interactor)
        view.presenter = presenter
    }
}
