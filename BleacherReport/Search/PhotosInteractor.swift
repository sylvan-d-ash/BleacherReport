//
//  PhotosInteractor.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


class PhotosInteractor: PhotosInteractorProtocol {

    // MARK: - Init

    private let webService: WebServiceProtocol

    init(webService: WebServiceProtocol) {
        self.webService = webService
    }

    // MARK: - Properties

    private lazy var searchQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Flickr Search Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    // MARK: - PhotosInteractorProtocol
    
    func getPhotos(with searchText: String, completion: @escaping (Result<[FlickrPhoto], Error>) -> Void) {

        // cancel any ongoing operations
        self.searchQueue.cancelAllOperations()

        // initiate new search operation
        self.searchQueue.addOperation { [weak self] in
            guard let `self` = self else { return }

            // fetch photos
            self.webService.search(for: searchText) { (result) in

                switch result {
                case .failure(let error):
                    completion(.failure(error))

                case .success(let data):
                    do {
                        // decode response
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(FlickrResponseObject.self, from: data)

                        // pass photos to completion
                        completion(.success(response.info.photos))
                    }
                    catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
