import SwiftUI

struct ResultsView: View {

    let correctCount: Int
    let maxStreak: Int
    let totalQuestions: Int



    var body: some View {
        VStack {
            Text("Квиз окончен!")
            Text("Ваш максимальный стрик: \(maxStreak)")
            Text("Ваш счёт: \(correctCount)/\(totalQuestions)")
        }
    }
}

#Preview {
    ResultsView(correctCount: 7, maxStreak: 5, totalQuestions: 9)
}
