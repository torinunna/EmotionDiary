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
    
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    
    @Published var date: Date = Date()
    @Published var mood: Mood = .great
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink { date in
            self.update(date: date)
        }.store(in: &subscriptions)
        
        $mood.sink { mood in
            self.update(mood: mood)
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
}
