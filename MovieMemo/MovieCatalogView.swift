//
//  MovieCatalogView.swift
//  MovieMemo
//
//  Created by Zaid Dahir on 2023-02-28.
//

import SwiftUI

struct MovieCatalogView: View {
    let movies: [Movie] = [
        Movie(
            title: "The Godfather",
          director: "Francis Ford Coppola",
            actors: "Marlon Brando, Al Pacino, James Caan",
            releaseDate: "March 14, 1972",
            synopsis: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
        ),
        Movie(
            title: "The Dark Knight",
            director: "Christopher Nolan",
            actors: "Christian Bale, Heath Ledger, Aaron Eckhart",
            releaseDate: "July 18, 2008",
            synopsis: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice."
        ),
        Movie(
            title: "The Shawshank Redemption",
             director: "Frank Darabont",
            actors: "Tim Robbins, Morgan Freeman, Bob Gunton",
            releaseDate: "September 23, 1994",
            synopsis: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."
        )
    ]
    
    var body: some View {
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRowView(movie: movie)
                }
            }
            .navigationTitle("Movie Catalog")
        }
    }
}

struct MovieCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCatalogView()
    }
}

