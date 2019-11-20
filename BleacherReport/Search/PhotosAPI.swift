//
//  PhotosAPI.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


protocol PhotosViewProtocol: class {
    func showLoader()
    func hideLoader()
}


protocol PhotosPresenterProtocol: class {
    var numberOfItems: Int { get }

    func viewDidLoad()
    func didSelect(itemAt index: Int)
}


protocol PhotosInteractorProtocol {
    func getPhotos(with searchText: String, completion: @escaping (Result<[FlickrPhoto], Error>) -> Void)
}
