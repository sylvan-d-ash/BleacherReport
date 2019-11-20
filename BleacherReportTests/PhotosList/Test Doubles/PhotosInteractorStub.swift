//
//  PhotosInteractorStub.swift
//  BleacherReportTests
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation
@testable import BleacherReport


class PhotosInteractorStub: PhotosInteractorProtocol {
    private(set) var didCallGetPhotos = false
    private(set) var searchText: String!
    var error: Error!
    var photos: [FlickrPhoto] = []

    init() {
        self.photos = [
            FlickrPhoto(id: "1", title: "One", farm: 55, server: "12345", secret: "12345"),
            FlickrPhoto(id: "2", title: "Two", farm: 55, server: "12345", secret: "23456"),
            FlickrPhoto(id: "3", title: "Three", farm: 55, server: "12345", secret: "34567"),
            FlickrPhoto(id: "4", title: "Four", farm: 55, server: "12345", secret: "45678"),
            FlickrPhoto(id: "5", title: "Five", farm: 55, server: "12345", secret: "56789"),
        ]
    }

    func getPhotos(with searchText: String, completion: @escaping (Result<[FlickrPhoto], Error>) -> Void) {
        self.didCallGetPhotos = true
        self.searchText = searchText

        if let error = self.error {
            completion(.failure(error))
            return
        }

        completion(.success(self.photos))
    }
}
