import SwiftUI

struct QuestionView: View {
    @ObservedObject var viewModel: QuizViewModel

    private func colorForAnswer(at index: Int) -> Color {
        guard let selected = viewModel.selectedAnswerIndex else {
            return .blue
        }
        if index == viewModel.currentQuestion.correctAnswer {
            return .green
        }
        if index == selected {
            return .red
        }
        return .gray
    }


    var body: some View {
        VStack {
            if !viewModel.isQuizFinished {
                StatLabel(label: viewModel.language.strings.correctCountLabel, stat: viewModel.correctCount)
                StatLabel(label: viewModel.language.strings.currentStreakLabel, stat: viewModel.currentStreak)
                Text(
                    "\(viewModel.language.strings.questionProgressLabel) \(viewModel.currentQuestionIndex+1)/\(viewModel.questions.count)"
                )
                Text(viewModel.currentQuestion.question)
                HStack() {
                    ForEach(viewModel.currentQuestion.answers.indices, id: \.self) {
                        index in


                        Button {
                            viewModel.submitAnswer(index)
                        } label: {
                            Text(viewModel.currentQuestion.answers[index])
                        }
                        .foregroundStyle(colorForAnswer(at: index))
                    }
                }
                if viewModel.selectedAnswerIndex != nil {
                    Button(viewModel.language.strings.nextButton) {
                        viewModel.moveToNextQuestion()
                    }
                    .foregroundStyle(Color.black)
                }
            } else {
                ResultsView(
                    language: viewModel.language, correctCount: viewModel.correctCount,
                    maxStreak: viewModel.maxStreak,
                    totalQuestions: viewModel.questions.count
                )
            }
        }
        .padding()
    }
}
