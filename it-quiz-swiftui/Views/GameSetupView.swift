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

            Picker(selectedLanguage.strings.categoryPickerTitle, selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) {category in
                    Text(category.displayName(for: selectedLanguage))
                }
            }


            Picker(selectedLanguage.strings.difficultyPickerTitle, selection: $selectedDifficulty) {
                ForEach(Difficulty.allCases, id: \.self) {difficulty in
                    Text(difficulty.displayName(for: selectedLanguage))
                }
            }

            Button() {
                startGame()
            } label: {
                Text(selectedLanguage.strings.startGameButton)
                    .padding()
            }
        }
        .padding()
        .navigationDestination(item: $activeViewModel) {
            viewModel in QuestionView(viewModel: viewModel)
        }
        .toolbar() {
            ToolbarItem(placement: .topBarTrailing) {
                LanguageFlagPicker(selectedLanguage: $selectedLanguage)
            }
        }
    }
}


#Preview {
    GameSetupView()
}
