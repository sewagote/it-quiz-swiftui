//
//  Qestions.swift
//  it-quiz-swiftui
//
//  Created by Ivan Krugov on 08.08.2026.
//

enum Language : String, Codable, CaseIterable {
    case russian, english

    var fileName : String {
        switch self {
        case .russian: return "questions_ru"
        case .english: return "questions_en"
        }
    }
}

enum Category: String, Codable, CaseIterable {
    case hardware, networking, programming, os
}

enum Difficulty: String, Codable, CaseIterable {
    case easy, medium, hard
}

struct Question : Codable {
    let question: String
    let answers: [String]
    let correctAnswer: Int
    let category: Category
    let diff: Difficulty
}

