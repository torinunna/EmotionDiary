//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/10.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
}
