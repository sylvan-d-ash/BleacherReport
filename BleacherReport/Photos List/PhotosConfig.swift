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
        let router = PhotosRouter(view)
        let interactor = PhotosInteractor(webService: WebService())
        let presenter = PhotosPresenter(view, interactor, router)
        view.presenter = presenter
    }
}
