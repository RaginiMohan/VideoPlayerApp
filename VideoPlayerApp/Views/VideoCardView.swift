//
//  VideoCardView.swift
//  VideoPlayerApp
//
//  Created by Ragini on 20/03/26.
//

import SwiftUI

struct VideoCardView: View {
    let video: Video

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: video.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .aspectRatio(1, contentMode: .fill)
            .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .center,
                endPoint: .bottom
            )

            VStack(alignment: .leading) {
                Text(video.user.name)
                    .font(.caption)
                    .foregroundColor(.white)

                Text("\(video.duration)s")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(6)
        }
        .cornerRadius(10)
    }
}
