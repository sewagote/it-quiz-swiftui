//
//  QuizViewModel.swift
//  it-quiz-swiftui
//
//  Created by Ivan Krugov on 15.08.2026.
//
import Foundation


class QuizViewModel: ObservableObject {
    let questions: [Question]
    @Published var isQuizFinished: Bool = false
    @Published var currentQuestionIndex: Int
    @Published var correctCount: Int
    @Published var currentStreak: Int
    @Published var maxStreak: Int
    let language: Language
    let category: Category
    let difficulty: Difficulty

    init(questions: [Question], language: Language, category: Category, difficulty: Difficulty) {
        self.questions = questions
        self.currentQuestionIndex = 0
        self.correctCount = 0
        self.currentStreak = 0
        self.maxStreak = 0
        self.language = language
        self.category = category
        self.difficulty = difficulty
    }

    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }

    func submitAnswer(_ index: Int) {
        if index == currentQuestion.correctAnswer {
            correctCount += 1
            currentStreak += 1
            if currentStreak > maxStreak {
                maxStreak = currentStreak
            }
        } else {
            currentStreak = 0
        }
    }

    func moveToNextQuestion() {
        if currentQuestionIndex < questions.count - 1  {
            currentQuestionIndex += 1
        } else {
            isQuizFinished = true
        }
    }
}
