//
//  PlayerView.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import SwiftUI
import AVKit

struct PlayerView: View {

    @StateObject private var viewModel: PlayerViewModel
    let videos: [Video]

    init(videos: [Video], selected: Video) {
        self.videos = videos
        _viewModel = StateObject(
            wrappedValue: PlayerViewModel(videos: videos, selected: selected)
        )
    }

    var body: some View {
        ScrollView {

            VStack(spacing: 16) {

                VideoPlayer(player: viewModel.player)
                    .aspectRatio(9/16, contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()

                Text("Next Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                LazyVGrid(
                    columns: Array(
                        repeating: GridItem(.flexible(), spacing: 12),
                        count: 3
                    ),
                    spacing: 12
                ) {
                    ForEach(videos.indices, id: \.self) { index in
                        let video = videos[index]

                        VStack(spacing: 6) {

                            AsyncImage(url: URL(string: video.image)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .aspectRatio(1, contentMode: .fill)
                            .clipped()
                            .cornerRadius(10)

                            Text(video.user.name)
                                .font(.caption2)
                                .foregroundColor(.white)
                                .lineLimit(1)
                        }
                        .padding(6)
                        .background(
                            index == viewModel.currentIndex
                            ? Color.blue.opacity(0.3)
                            : Color.clear
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.play(index: index)
                        }
                    }
                }
                .padding(.horizontal)

            }
        }
        .background(Color.black)
    }
}
