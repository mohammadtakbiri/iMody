//
//  QuestionManager.swift
//  iMody
//
//  Created by Mohammad Takbiri on 4/14/25.
//

import Foundation

class QuestionManager: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var moodScores: [Mood: Int] = [
        .stress: 0,
        .sad: 0,
        .foggy: 0,
        .happy: 0
    ]
    
    // Store answers for back functionality
    @Published var answers: [Int: Mood] = [:]
    
    let questions = [
        Question(
            id: 1,
            text: "What would you like to do today?",
            options: [
                QuestionOption(text: "Be alone", mood: .sad),
                QuestionOption(text: "Talk to someone", mood: .stress),
                QuestionOption(text: "Listen to something", mood: .foggy),
                QuestionOption(text: "Do something to feel better", mood: .happy)
            ]
        ),
        Question(
            id: 2,
            text: "Since you woke up, how do you feel?",
            options: [
                QuestionOption(text: "Unmotivated", mood: .sad),
                QuestionOption(text: "A bit angry", mood: .stress),
                QuestionOption(text: "Full of thoughts", mood: .foggy),
                QuestionOption(text: "Happy", mood: .happy)
            ]
        ),
        Question(
            id: 3,
            text: "Which statement resonates with you the most?",
            options: [
                QuestionOption(text: "I need a deep breath", mood: .foggy),
                QuestionOption(text: "Everything feels overwhelming", mood: .stress),
                QuestionOption(text: "I'm losing control", mood: .stress),
                QuestionOption(text: "I'm feeling good today", mood: .happy)
            ]
        ),
        Question(
            id: 4,
            text: "When thinking about the weekend, what comes to mind?",
            options: [
                QuestionOption(text: "I prefer staying at home", mood: .sad),
                QuestionOption(text: "I want to get away from everyone", mood: .stress),
                QuestionOption(text: "Maybe I need a mental break", mood: .foggy),
                QuestionOption(text: "I want to make plans and have fun", mood: .happy)
            ]
        ),
        Question(
            id: 5,
            text: "If you were to listen to music right now, what would you choose?",
            options: [
                QuestionOption(text: "A quiet and soft music", mood: .foggy),
                QuestionOption(text: "A sad and emotional song", mood: .sad),
                QuestionOption(text: "A calming or nature sound", mood: .stress),
                QuestionOption(text: "An upbeat and energetic song", mood: .happy)
            ]
        )
    ]
    
    func goBack() {
        if currentQuestionIndex > 0 {
            // Remove the last answer
            if let lastMood = answers[currentQuestionIndex] {
                moodScores[lastMood] = (moodScores[lastMood] ?? 1) - 1
            }
            answers.removeValue(forKey: currentQuestionIndex)
            currentQuestionIndex -= 1
        }
    }
    
    func reset() {
        currentQuestionIndex = 0
        moodScores = [
            .stress: 0,
            .sad: 0,
            .foggy: 0,
            .happy: 0
        ]
        answers.removeAll()
    }
    
    func recordAnswer(mood: Mood) {
        moodScores[mood] = (moodScores[mood] ?? 0) + 1
        answers[currentQuestionIndex] = mood
    }
    
    func analyzeMood() -> Mood {
        // Priority order for tie-breaking
        let moodPriority: [Mood] = [.stress, .sad, .foggy, .happy]
        
        // Find the highest score
        let maxScore = moodScores.values.max() ?? 0
        
        // Get all moods with the highest score
        let topMoods = moodScores.filter { $0.value == maxScore }.map { $0.key }
        
        // If there's a tie, use priority list
        if topMoods.count > 1 {
            return moodPriority.first { topMoods.contains($0) } ?? .happy
        }
        
        // If there's a clear winner, return it
        return topMoods.first ?? .happy
    }
}
