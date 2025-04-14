//
//  ContentView.swift
//  iMody
//
//  Created by Mohammad Takbiri on 4/13/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var questionManager = QuestionManager()
    @State private var showResult = false
    @State private var currentMood: Mood?
    @State private var gradientStart = UnitPoint(x: 0, y: 0)
    @State private var gradientEnd = UnitPoint(x: 1, y: 1)
    
    var body: some View {
        ZStack {
            // Animated gradient background
            LinearGradient(
                colors: currentMood?.gradientColors ?? [.blue.opacity(0.2), .purple.opacity(0.2)],
                startPoint: gradientStart,
                endPoint: gradientEnd
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 2), value: currentMood)
            .onAppear {
                withAnimation(.easeInOut(duration: 6).repeatForever()) {
                    gradientStart = UnitPoint(x: 1, y: 1)
                    gradientEnd = UnitPoint(x: 0, y: 0)
                }
            }
            
            VStack {
                if !showResult {
                    QuestionBox(
                        question: questionManager.questions[questionManager.currentQuestionIndex],
                        onAnswer: handleAnswer,
                        onBack: handleBack,
                        showBackButton: questionManager.currentQuestionIndex > 0
                    )
                    .transition(.slide)
                } else {
                    ResultView(
                        mood: currentMood ?? .happy,
                        onPlaylistTap: openPlaylist,
                        onRestart: restartQuiz
                    )
                    .transition(.scale)
                }
            }
            .padding()
        }
    }
    
    private func handleAnswer(option: QuestionOption) {
        questionManager.recordAnswer(mood: option.mood)
        
        if questionManager.currentQuestionIndex < questionManager.questions.count - 1 {
            withAnimation {
                questionManager.currentQuestionIndex += 1
            }
        } else {
            currentMood = questionManager.analyzeMood()
            withAnimation {
                showResult = true
            }
        }
    }
    
    private func handleBack() {
        withAnimation {
            questionManager.goBack()
        }
    }
    
    private func restartQuiz() {
        withAnimation {
            questionManager.reset()
            showResult = false
            currentMood = nil
        }
    }
    
    private func openPlaylist() {
        guard let mood = currentMood,
              let url = URL(string: mood.playlistURL) else { return }
        UIApplication.shared.open(url)
    }
}

#Preview {
    ContentView()
}
