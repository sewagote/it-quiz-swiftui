//
//  QuestionView.swift
//  it-quiz-swiftui
//
//  Created by Ivan Krugov on 15.08.2026.
//
import SwiftUI

struct QuestionView: View {
    @ObservedObject var viewModel: QuizViewModel
    var body: some View {
        Text(viewModel.currentQuestion.question)
        HStack() {
            ForEach(viewModel.currentQuestion.answers.indices, id: \.self) {
                index in Button {
                    viewModel.submitAnswer(index)
                } label: {
                    Text(viewModel.currentQuestion.answers[index])
                }
            }
        }
        .padding()
    }
}


let questionExample: Question = Question(
    question: "1 + 1",
    answers: ["1", "2", "3"],
    correctAnswer: 1,
    category: .programming,
    diff: .easy
)

#Preview {
    QuestionView(viewModel: QuizViewModel(
        questions: [questionExample],
        language: .russian,
        category: .hardware,
        difficulty: .easy
    ))
}
