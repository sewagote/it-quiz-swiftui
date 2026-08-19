import SwiftUI

struct QuestionView: View {
    @ObservedObject var viewModel: QuizViewModel
    var body: some View {
        VStack {
            if !viewModel.isQuizFinished {
                Text(
                    "\(viewModel.language.strings.correctCountLabel) \(viewModel.correctCount)"
                )
                Text(
                    "\(viewModel.language.strings.currentStreakLabel) \(viewModel.currentStreak)"
                )
                Text(
                    "\(viewModel.language.strings.questionProgressLabel) \(viewModel.currentQuestionIndex+1)/\(viewModel.questions.count)"
                )
                Text(viewModel.currentQuestion.question)
                HStack() {
                    ForEach(viewModel.currentQuestion.answers.indices, id: \.self) {
                        index in
                        let isCorrectAnswer = index == viewModel.currentQuestion.correctAnswer
                        let isSelected = index == viewModel.selectedAnswerIndex
                        let hasAnswered = viewModel.selectedAnswerIndex != nil

                        let buttonColor: Color = {

                            if !hasAnswered {
                                return .blue
                            } else if isCorrectAnswer {
                                return .green
                            } else if isSelected {
                                return .red
                            } else {
                                return .gray
                            }
                        }()

                        Button {
                            viewModel.submitAnswer(index)
                        } label: {
                            Text(viewModel.currentQuestion.answers[index])
                        }
                        .foregroundStyle(buttonColor)
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



let questionsExample: [Question] = [
    Question(question: "1 + 1", answers: ["1", "2", "3"], correctAnswer: 1, category: .programming, diff: .easy),
    Question(question: "2 + 2", answers: ["2", "4", "6"], correctAnswer: 1, category: .programming, diff: .easy),
    Question(question: "3 + 3", answers: ["4", "8", "6"], correctAnswer: 2, category: .programming, diff: .easy)
]

#Preview {
    QuestionView(viewModel: QuizViewModel(
        questions: questionsExample,
        language: .english,
        category: .hardware,
        difficulty: .easy
    ))
}
