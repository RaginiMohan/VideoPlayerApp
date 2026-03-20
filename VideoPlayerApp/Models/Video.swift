//
//  Video.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import Foundation

struct VideoResponse: Codable {
    let videos: [Video]
}

struct Video: Codable, Identifiable {
    let id: Int
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFile]

    enum CodingKeys: String, CodingKey {
        case id, image, duration, user
        case videoFiles = "video_files"
    }
}

struct User: Codable {
    let name: String
}

struct VideoFile: Codable {
    let link: String
    let quality: String
}
