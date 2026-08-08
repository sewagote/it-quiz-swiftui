//
//  Loader.swift
//  it-quiz-swiftui
//
//  Created by Ivan Krugov on 08.08.2026.
//
import Foundation

func loadQuestions(fileName: String) -> [Question] {
    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        fatalError("Файл не найден")
    }
    guard let data = try? Data(contentsOf: fileURL) else {
        fatalError("Не удалось прочитать данные из файла")
    }
    guard let decode = try? JSONDecoder().decode([Question].self, from: data) else {
        fatalError("Не получилось декодировать данные")
    }
    return decode
}
