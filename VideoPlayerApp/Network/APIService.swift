//
//  APIService.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import Foundation

final class APIService {

    private let apiKey = "8qlJ5Fbchawzl8iaEEo9W0Z4mGG2Pn5p9cfL9FPbW9k9XFNcgsmsCeFD"

    func fetchVideos(page: Int, perPage: Int = 10) async throws -> [Video] {
        let urlString = "https://api.pexels.com/videos/popular?page=\(page)&per_page=\(perPage)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(VideoResponse.self, from: data)
        return decoded.videos
    }
}
