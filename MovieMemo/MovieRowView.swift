//
//  MovieRowView.swift
//  MovieMemo
//
//  Created by Zaid Dahir on 2023-02-28.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.headline)
            Text(movie.director)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(
            title: "The Godfather",
            director: "Francis Ford Coppola",
            actors: "Marlon Brando, Al Pacino, James Caan",
            releaseDate: "March 14, 1972",
            synopsis: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
        )
        MovieRowView(movie: movie)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

