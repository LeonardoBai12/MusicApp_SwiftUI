//
//  PlaylistScreenView.swift
//  MusicApp_SwiftUI
//
//  Created by Leonardo Bai on 03/09/23.
//

import SwiftUI

struct PlaylistScreen: View {
    var playlist = Playlist(
        name: "Playlist LB12",
        userName: "Leonardo Bai",
        userAvatar: "lb12_avatar",
        description: "This is the best playlist ever made, if you hear it you'll become smarter than you've ever been.",
        coverUrl: "lb12",
        tracks: Song.getTracks()
    )
    @State private var isScrolled: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(playlist.coverUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 60)
                .padding(.top, isScrolled ? 0 : 20)
                .animation(Animation.spring(), value: isScrolled ? 0 : 20)

            ScrollView {
                Spacer()
                    .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image(systemName: "arrow.down.circle.fill")
                            .imageScale(.large)
                        Image(systemName: "person.fill.badge.plus")
                            .imageScale(.large)
                        
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                    }.padding(.vertical)
                    
                    Text(playlist.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 10)
                    Text(playlist.description)
                    
                    HStack(alignment: .center) {
                        Image("lb12_avatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        VStack(alignment: .center) {
                            Text(playlist.userName)
                                .bold()
                                .font(.title3)
                            
                        }.frame(height: 30)
                    }.padding(.vertical)
                        .padding(.bottom, 10)
                    
                    ForEach(playlist.tracks) { song in
                        TrackRow(song: song)
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }.padding(.horizontal, 25)
                    .background(.background)
                    .background(
                        GeometryReader {
                            Color.clear.preference(
                                key: ViewOffsetKey.self,
                                value: -$0.frame(
                                    in: .named("scroll")).origin.y
                                )
                            }
                    ).onPreferenceChange(ViewOffsetKey.self) { value in
                        print("offset >> \(value)")
                        if value > -300 && !isScrolled {
                            isScrolled.toggle()
                        } else if value <= -300 && isScrolled {
                            isScrolled.toggle()
                        }
                    }
            }.coordinateSpace(name: "scroll")
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct PlaylistScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistScreen()
    }
}


struct TrackRow: View {
    let song: Song
    
    var body: some View {
        HStack {
            Image(song.coverUrl)
                .resizable()
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(song.title)
                    .bold()
                    .font(.title3)
                HStack {
                    if song.isExplicit {
                        Image(systemName: "e.square.fill")
                    }
                    Text(song.author)
                }
            }.padding(.leading, 10)
            Spacer()
            Image(systemName: "ellipsis")
        }.padding(.bottom, 20)
    }
}
