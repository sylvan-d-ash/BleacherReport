//
//  PhotosRouter.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import UIKit


class PhotosRouter: PhotosRouterProtocol {
    private weak var view: UIViewController?

    init(_ view: UIViewController?) {
        self.view = view
    }

    func showFullPreview(for photo: FlickrPhoto) {

        let storyboard = UIStoryboard(name: "Photo", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PhotoViewController
        viewController.photo = photo

        self.view?.present(viewController, animated: true, completion: nil)
    }
}
