//
//  PlayerViewModel.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import AVKit
import Combine

@MainActor
final class PlayerViewModel: ObservableObject {

    @Published var player = AVPlayer()
    @Published var currentIndex: Int

    private let videos: [Video]

    init(videos: [Video], selected: Video) {
        self.videos = videos
        self.currentIndex = videos.firstIndex { $0.id == selected.id } ?? 0
        playCurrent()
    }

    private func playCurrent() {
        guard currentIndex < videos.count else { return }

        let video = videos[currentIndex]

        guard let url = bestURL(video) else { return }

        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        player.play()

        observeEnd()
    }

    private func observeEnd() {
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { [weak self] _ in
            self?.next()
        }
    }

    func next() {
        guard currentIndex + 1 < videos.count else { return }
        currentIndex += 1
        playCurrent()
    }

    func play(index: Int) {
        currentIndex = index
        playCurrent()
    }

    private func bestURL(_ video: Video) -> URL? {
        let sorted = video.videoFiles.sorted {
            $0.quality == "hd" && $1.quality != "hd"
        }
        return URL(string: sorted.first?.link ?? "")
    }
}
