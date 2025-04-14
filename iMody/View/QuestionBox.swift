//
//  QuestionBox.swift
//  iMody
//
//  Created by Mohammad Takbiri on 4/14/25.
//

import Foundation
import SwiftUI

struct QuestionBox: View {
    let question: Question
    let onAnswer: (QuestionOption) -> Void
    let onBack: () -> Void
    let showBackButton: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            if showBackButton {
                HStack {
                    Button(action: onBack) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                    }
                    Spacer()
                }
            }
            
            Text(question.text)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            ForEach(Array(question.options.enumerated()), id: \.0) { index, option in
                Button(action: { onAnswer(option) }) {
                    Text(option.text)
                        .frame(maxWidth: .infinity)
                        .padding()
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
