//
//  PhotosPresenter.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


class PhotosPresenter: PhotosPresenterProtocol {
    private var view: PhotosViewProtocol?
    private let interactor: PhotosInteractorProtocol

    init(_ view: PhotosViewProtocol, _ interactor: PhotosInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    private var photos: [FlickrPhoto] = []
    var numberOfItems: Int { return self.photos.count }

    func viewDidLoad() {
        self.interactor.getPhotos(with: "winter") { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let photos):
                self.photos = photos
                print(photos)
            }
        }
    }

    func didSelect(itemAt index: Int) {
        //
    }
}
