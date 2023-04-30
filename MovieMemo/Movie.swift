//
//  Movie.swift
//  MovieMemo
//
//  Created by Zaid Dahir on 2023-02-28.
//

import Foundation

import Foundation
import SwiftUI

struct Movie: Codable, Identifiable {
    var id = UUID()
    var title: String

    var director: String
    var actors: String
    var releaseDate: String
    var synopsis: String
    var audioRecordings: [URL] = []
    
}


