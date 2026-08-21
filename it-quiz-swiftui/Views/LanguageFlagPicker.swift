import SwiftUI

struct LanguageFlagPicker: View {
    @Binding var selectedLanguage: Language
    var body: some View {
        HStack {

            Button {
                selectedLanguage = .russian
            } label: {
                Text("🇷🇺")
                    .opacity(selectedLanguage == .russian ? 1.0 : 0.4)
            }

            Button {
                selectedLanguage = .english
            } label: {
                Text("🇺🇸")
                    .opacity(selectedLanguage == .english ? 1.0 : 0.4)
            }
        }
    }
}


