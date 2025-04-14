//
//  Question.swift
//  iMody
//
//  Created by Mohammad Takbiri on 4/14/25.
//

import Foundation

struct Question: Identifiable {
    let id: Int
    let text: String
    let options: [QuestionOption]
}

struct QuestionOption {
    let text: String
    let mood: Mood
}
