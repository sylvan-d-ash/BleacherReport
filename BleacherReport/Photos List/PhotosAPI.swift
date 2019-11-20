//
//  PhotosAPI.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


// MARK: - PhotosViewProtocol

protocol PhotosViewProtocol: class {
    func showLoader()
    func hideLoader()
    func showError(title: String, message: String?)
    func reloadView()
}


// MARK: - PhotosPresenterProtocol

protocol PhotosPresenterProtocol: class {
    var numberOfItems: Int { get }

    func search(for text: String?)
    func configure(_ cell: PhotoCellProtocol, forRowAt index: Int)
    func didSelect(itemAt index: Int)
}


// MARK: - PhotosInteractorProtocol

protocol PhotosInteractorProtocol {
    func getPhotos(with searchText: String, completion: @escaping (Result<[FlickrPhoto], Error>) -> Void)
}


// MARK: - PhotosRouterProtocol

protocol PhotosRouterProtocol {
    func showFullPreview(for photo: FlickrPhoto)
}
