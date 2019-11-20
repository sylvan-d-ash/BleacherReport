//
//  PhotosPresenter.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


class PhotosPresenter: PhotosPresenterProtocol {

    // MARK: - Init

    private var view: PhotosViewProtocol?
    private let interactor: PhotosInteractorProtocol

    init(_ view: PhotosViewProtocol, _ interactor: PhotosInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    // MARK: - Properties

    private var photos: [FlickrPhoto] = []

    // MARK: - PhotosPresenterProtocol

    var numberOfItems: Int { return self.photos.count }

    func viewDidLoad() {
        self.interactor.getPhotos(with: "winter") { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.showError(title: "Error getting images", message: error.localizedDescription)

            case .success(let photos):
                self.photos = photos
                print(photos)
                self.view?.reloadView()
            }
        }
    }

    func search(for text: String?) {

        guard let text = text else {
            // TODO: clear display
            return
        }

        // search for text longer than 2 characters
        guard text.count > 2 else { return }

        // search
        self.interactor.getPhotos(with: text) { (result) in

            switch result {
            case .failure(let error):
                print(error.localizedDescription)

            case .success(let photos):
                self.photos = photos
                print(photos)
            }
        }
    }

    func configure(_ cell: PhotoCellProtocol, forRowAt index: Int) {

        let photo = self.photos[index]
        cell.display(title: photo.title)

        // get url
        let size = "thumbnail"
        guard let url = URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_\(size).jpg") else { return }
        cell.display(image: url)
    }

    func didSelect(itemAt index: Int) {
        //
    }
}
