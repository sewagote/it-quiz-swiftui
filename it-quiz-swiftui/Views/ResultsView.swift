import SwiftUI

struct ResultsView: View {
    
    let language: Language
    let correctCount: Int
    let maxStreak: Int
    let totalQuestions: Int



    var body: some View {
        VStack {
            Text(language.strings.quizFinished)
            Text("\(language.strings.maxStreakLabel) \(maxStreak)")
            Text("\(language.strings.scoreLabel) \(correctCount)/\(totalQuestions)")
        }
    }
}

#Preview {
    ResultsView(
        language: .english,
        correctCount: 7,
        maxStreak: 5,
        totalQuestions: 9
    )
}
