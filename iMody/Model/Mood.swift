//
//  Mood.swift
//  iMody
//
//  Created by Mohammad Takbiri on 4/14/25.
//

import Foundation
import SwiftUI

enum Mood: String {
    case stress = "Stress"    // 😠
    case sad = "Sad"         // 😔
    case foggy = "Foggy"     // 😶
    case happy = "Happy"     // 😊
    
    var playlistURL: String {
        switch self {
        case .stress:
            return "https://music.apple.com/us/playlist/feeling-angry/pl.99aab7ddb4034503bef6278112843dba"
        case .sad:
            return "https://music.apple.com/us/playlist/feeling-sad/pl.aa6824f258604a76ba475a4649acabf0"
        case .happy:
            return "https://music.apple.com/us/playlist/feeling-happy/pl.f4d106fed2bd41149aaacabb233eb5eb"
        case .foggy:
            return "https://music.apple.com/us/playlist/deep-focus/pl.556863bb540c4651b6196bf82e2a3bb9"
        }
    }
    
    var motivationalMessage: String {
        switch self {
        case .stress:
            return "Take a deep breath. This moment shall pass. Let's find some calm together."
        case .sad:
            return "It's okay to feel this way. You're stronger than you think."
        case .foggy:
            return "Sometimes we all need a mental break. Let's clear your mind together."
        case .happy:
            return "What a wonderful day! Keep spreading those positive vibes!"
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .stress:
            return [.red.opacity(0.3), .orange.opacity(0.3)]
        case .sad:
            return [.blue.opacity(0.3), .purple.opacity(0.3)]
        case .foggy:
            return [.gray.opacity(0.3), .blue.opacity(0.3)]
        case .happy:
            return [.green.opacity(0.3), .mint.opacity(0.3)]
        }
    }
}
