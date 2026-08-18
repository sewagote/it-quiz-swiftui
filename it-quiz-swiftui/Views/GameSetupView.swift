import Foundation
import SwiftUI

struct GameSetupView: View {
    @State private var activeViewModel: QuizViewModel?
    @State private var selectedLanguage: Language = .russian
    @State private var selectedCategory: Category = .os
    @State private var selectedDifficulty: Difficulty = .easy


    private func startGame() {
        let allQuestions = loadQuestions(fileName: selectedLanguage.fileName)
        let filtered = allQuestions.filter { question in
            question.category == selectedCategory && question.diff == selectedDifficulty
        }
        let shuffled = filtered.shuffled()
        let viewModel = QuizViewModel(
            questions: shuffled,
            language: selectedLanguage,
            category: selectedCategory,
            difficulty: selectedDifficulty
        )
        activeViewModel = viewModel
    }


    var body: some View {
        VStack {
            Picker("Язык", selection: $selectedLanguage) {
                ForEach(Language.allCases, id: \.self) {language in
                    Text(language.displayName)
                }
            }

            Picker("Категория", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) {category in
                    Text(category.displayName(for: selectedLanguage))
                }
            }


            Picker("Сложность", selection: $selectedDifficulty) {
                ForEach(Difficulty.allCases, id: \.self) {difficulty in
                    Text(difficulty.displayName(for: selectedLanguage))
                }
            }

            Button() {
                startGame()
            } label: {
                Text("Начать игру")
                    .padding()
            }
        }
        .padding()
        .navigationDestination(item: $activeViewModel) {
            viewModel in QuestionView(viewModel: viewModel)
        }
    }
}


#Preview {
    GameSetupView()
}
