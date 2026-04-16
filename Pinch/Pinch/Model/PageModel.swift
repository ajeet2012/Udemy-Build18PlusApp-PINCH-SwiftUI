//
//  PageModel.swift
//  Pinch
//
//  Created by Ajeet Sharma on 16/04/26.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
    
}

extension Page {
    var thumbnailImageName: String {
        return "thumb-\(imageName)"
    }
}
