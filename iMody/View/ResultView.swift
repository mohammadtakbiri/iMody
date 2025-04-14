//
//  ResultView.swift
//  iMody
//
//  Created by Mohammad Takbiri on 4/14/25.
//

import Foundation
import SwiftUI

struct ResultView: View {
    let mood: Mood
    let onPlaylistTap: () -> Void
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text(mood.motivationalMessage)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            VStack(spacing: 15) {
                Button(action: onPlaylistTap) {
                    Label("Perfect Playlist for You", systemImage: "music.note")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                }
                
                Button(action: onRestart) {
                    Label("Start Over", systemImage: "arrow.counterclockwise")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
        )
        .shadow(radius: 10)
    }
}
