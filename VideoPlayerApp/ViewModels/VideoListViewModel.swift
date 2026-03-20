//
//  VideoListViewModel.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import Foundation
import Combine

@MainActor
final class VideoListViewModel: ObservableObject {

    enum State {
        case loading
        case loaded([Video])
        case error(String)
    }

    @Published private(set) var state: State = .loading

    private let service = APIService()
    private var page = 1
    private var isFetching = false
    private var videos: [Video] = []

    func fetchVideos() async {
        guard !isFetching else { return }
        isFetching = true

        do {
            let newVideos = try await service.fetchVideos(page: page)
            videos.append(contentsOf: newVideos)
            state = .loaded(videos)
            page += 1
        } catch {
            state = .error(error.localizedDescription)
        }

        isFetching = false
    }
}
