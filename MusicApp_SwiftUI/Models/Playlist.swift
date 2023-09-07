//
//  Playlist.swift
//  MusicApp_SwiftUI
//
//  Created by Leonardo Bai on 04/09/23.
//

import Foundation

struct Playlist {
    let id = UUID()
    let name: String
    let userName: String
    let userAvatar: String
    let description: String
    let coverUrl: String
    let tracks: [Song]
}
