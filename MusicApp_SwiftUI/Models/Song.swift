//
//  Song.swift
//  MusicApp_SwiftUI
//
//  Created by Leonardo Bai on 04/09/23.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverUrl: String
    var isExplicit = false
}

extension Song {
    static func getTracks() -> [Song] {
        [
            Song(
                title: "Best Day Ever",
                author: "Mac Miller",
                coverUrl: "macmiller_bde"
            ),
            Song(
                title: "Self Care",
                author: "Mac Miller",
                coverUrl: "macmiller_swimming",
                isExplicit: true
            ),
            Song(
                title: "Ladders",
                author: "Mac Miller",
                coverUrl: "macmiller_swimming",
                isExplicit: true
            ),
            Song(
                title: "Jet Fuel",
                author: "Mac Miller",
                coverUrl: "macmiller_swimming",
                isExplicit: true
            ),
            Song(
                title: "A Vida É Desafio",
                author: "Racionais MC's",
                coverUrl: "racionais"
            ),
            Song(
                title: "Mun Rá",
                author: "Sabotage",
                coverUrl: "sabotage"
            ),
            Song(
                title: "That's My Way",
                author: "Edi Rock + Seu Jorge",
                coverUrl: "edirock"
            ),
            Song(
                title: "Irmão DQbrada!",
                author: "Costa GOld",
                coverUrl: "costagold"
            ),
            Song(
                title: "Today Was A Good Day",
                author: "Ice Cube",
                coverUrl: "icecube",
                isExplicit: true
            ),
            Song(
                title: "Darkness",
                author: "Eminem",
                coverUrl: "eminem_mtbmb",
                isExplicit: true
            ),
            Song(
                title: "3 A.M.",
                author: "Eminem",
                coverUrl: "eminem",
                isExplicit: true
            ),
            Song(
                title: "We Made You",
                author: "Eminem",
                coverUrl: "eminem"
            ),
        ]
    }
}
