enum Language : String, Codable, CaseIterable {
    case russian, english



    var fileName : String {
        switch self {
        case .russian: return "questions_ru"
        case .english: return "questions_en"
        }
    }

    var displayName: String {
        switch self {
        case .russian: return "Русский"
        case .english: return "English"
        }
    }
}

enum Category: String, Codable, CaseIterable {
    case hardware, networking, programming, os

    func displayName(for lang: Language) -> String {
        switch lang {
        case .russian:
            switch self {
            case .hardware : return "Железо"
            case .networking : return "Сети"
            case .programming : return "Программирование"
            case .os : return "Операционные системы"
            }
        case .english:
            switch self {
            case .hardware : return "Hardware"
            case .networking : return "Networking"
            case .programming : return "Programming"
            case .os : return "Operating Systems"
            }
        }
    }
}


enum Difficulty: String, Codable, CaseIterable {
    case easy, medium, hard

    func displayName(for lang: Language) -> String {
        switch lang {
        case .russian:
            switch self {
            case .easy : return "Легко"
            case .medium : return "Средне"
            case .hard : return "Сложно"
            }
        case .english:
            switch self {
            case .easy : return "Easy"
            case .medium : return "Medium"
            case .hard : return "Hard"
            }
        }
    }
}

struct Question : Codable {
    let question: String
    let answers: [String]
    let correctAnswer: Int
    let category: Category
    let diff: Difficulty
}

struct UIStrings {
    let nextButton: String
    let quizFinished: String
    let maxStreakLabel: String
    let scoreLabel: String
    let correctCountLabel: String
    let currentStreakLabel: String
    let questionProgressLabel: String
    let languagePickerTitle: String
    let categoryPickerTitle: String
    let difficultyPickerTitle: String
    let startGameButton: String
    let startAgainButton: String
}

extension Language {
    var strings: UIStrings {
        switch self {
        case .russian:
            return UIStrings(
                nextButton: "Далее",
                quizFinished: "Квиз завершен!",
                maxStreakLabel: "Максимальный стрик",
                scoreLabel: "Ваш счёт",
                correctCountLabel: "Количество верно отвеченных вопросов",
                currentStreakLabel: "Нынешний стрик",
                questionProgressLabel: "Счёт вопросов",
                languagePickerTitle: "Язык",
                categoryPickerTitle: "Категория",
                difficultyPickerTitle: "Сложность",
                startGameButton: "Начать игру",
                startAgainButton: "Начать игру заново"
            )
        case .english:
            return UIStrings(
                nextButton: "Next",
                quizFinished: "Quiz is finished!",
                maxStreakLabel: "Max streak",
                scoreLabel: "Your score",
                correctCountLabel: "Correct answers",
                currentStreakLabel: "Current streak",
                questionProgressLabel: "Question",
                languagePickerTitle: "Language",
                categoryPickerTitle: "Category",
                difficultyPickerTitle: "Difficulty",
                startGameButton: "Start game",
                startAgainButton: "Start game again"
            )

        }
    }
}
