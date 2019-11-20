//
//  FlickrPhoto.swift
//  BleacherReport
//
//  Created by Sylvan Ash on 19/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


/**
 {
 "id": "49091258072",
 "owner": "185400551@N04",
 "secret": "a47419f203",
 "server": "65535",
 "farm": 66,
 "title": "ALBERI",
 "ispublic": 1,
 "isfriend": 0,
 "isfamily": 0
 },
 */

struct FlickrResponseObject: Decodable {
    let info: FlickrResponseInfo

    enum CodingKeys: String, CodingKey {
        case info = "photos"
    }
}

struct FlickrResponseInfo: Decodable {
    let total: String
    let photos: [FlickrPhoto]

    enum CodingKeys: String, CodingKey {
        case total
        case photos = "photo"
    }
}

struct FlickrPhoto: Decodable {
    let id: String
    let title: String
    let farm: Int
    let server: String
    let secret: String
}
