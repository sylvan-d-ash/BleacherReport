//
//  WebService.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 19/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


protocol WebServiceProtocol {
    func search(for text: String, completion: @escaping (Result<Data, Error>) -> Void)
}


class WebService: WebServiceProtocol {
    func search(for text: String, completion: @escaping (Result<Data, Error>) -> Void) {

        guard let searchUrl = self.getSearchUrl(for: text) else { return }

        URLSession.shared.dataTask(with: searchUrl) { (dataOrNil, responseOrNil, errorOrNil) in

            if let error = errorOrNil {
                completion(.failure(error))
                return
            }

            guard let data = dataOrNil else { return }
            completion(.success(data))

        }.resume()
    }

    private func getSearchUrl(for text: String) -> URL? {

        guard let escapedSearchText = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) else {
            return nil
        }

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.flickr.com"
        components.path = "/services/rest"

        // build query string
        components.queryItems = []

        //https://api.flickr.com/services/rest/?
        //method=flickr.photos.search&api_key=1508443e49213ff84d566777dc211f2a&text=winter&per_page=20&format=json&nojsoncallback=1

        // query components
        components.queryItems?.append(URLQueryItem(name: "api_key", value: "1508443e49213ff84d566777dc211f2a"))
        components.queryItems?.append(URLQueryItem(name: "method", value: "flickr.photos.search"))
        components.queryItems?.append(URLQueryItem(name: "text", value: "\(escapedSearchText)"))
        components.queryItems?.append(URLQueryItem(name: "per_page", value: "25"))
        components.queryItems?.append(URLQueryItem(name: "format", value: "json"))
        components.queryItems?.append(URLQueryItem(name: "nojsoncallback", value: "1"))

        return components.url
    }
}
