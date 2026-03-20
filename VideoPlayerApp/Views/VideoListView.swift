//
//  VideoListView.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import SwiftUI

struct VideoListView: View {

    @StateObject private var viewModel = VideoListViewModel()

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Videos")
        }
        .task {
            await viewModel.fetchVideos()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .loading:
            VStack(spacing: 16) {
                ProgressView()
                Text("Loading videos...")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .loaded(let videos):
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                    ForEach(videos) { video in
                        NavigationLink {
                            PlayerView(videos: videos, selected: video)
                        } label: {
                            VideoCardView(video: video)
                        }
                        .onAppear {
                            if video.id == videos.last?.id {
                                Task { await viewModel.fetchVideos() }
                            }
                        }
                    }
                }
                .padding()
            }

        case .error(let message):
            VStack(spacing: 10) {
                Text("Something went wrong")
                Text(message)
                    .font(.caption)

                Button("Retry") {
                    Task { await viewModel.fetchVideos() }
                }
            }
        }
    }
}
