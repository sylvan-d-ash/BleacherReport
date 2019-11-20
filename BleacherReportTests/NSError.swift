//
//  NSError.swift
//  BleacherReportTests
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation

extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
