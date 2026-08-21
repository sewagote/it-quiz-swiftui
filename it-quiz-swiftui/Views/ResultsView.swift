import SwiftUI

struct ResultsView: View {
    
    let language: Language
    let correctCount: Int
    let maxStreak: Int
    let totalQuestions: Int
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        VStack {
            Text(language.strings.quizFinished)
                .padding(30)
            StatLabel(label: language.strings.maxStreakLabel, stat: maxStreak)
                .padding(15)
            Text("\(language.strings.scoreLabel) \(correctCount)/\(totalQuestions)")
            Button {
                dismiss()
            } label: {
                Text("\(language.strings.startAgainButton)")
                    .foregroundStyle(.red)
                    .padding(15)
            }
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
