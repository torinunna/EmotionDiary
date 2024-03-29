//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/11.
//

import Foundation
import SwiftUI
import Combine

final class DiaryViewModel: ObservableObject {
    
    @Published var diaryList: Binding<[MoodDiary]>
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    
    @Published var date: Date = Date()
    @Published var mood: Mood = .great
    @Published var text: String = ""
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>, diaryList: Binding<[MoodDiary]>) {
        self.isPresented = isPresented
        self.diaryList = diaryList
        
        $date.sink { date in
            self.update(date: date)
        }.store(in: &subscriptions)
        
        $mood.sink { mood in
            self.update(mood: mood)
        }.store(in: &subscriptions)
        
        $text.sink { text in
            self.update(text: text)
        }.store(in: &subscriptions)
    }
    
    func update(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        self.diary.date = formatter.string(from: date)
    }
    
    func update(mood: Mood) {
        self.diary.mood = mood
    }
    
    func update(text: String) {
        self.diary.text = text
    }
    
    func completed() {
        guard diary.date.isEmpty == false else { return }
        diaryList.wrappedValue.append(diary)
        isPresented.wrappedValue = false
    }
}
