//
//  DiaryDetailViewModel.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/14.
//

import Foundation
import SwiftUI

final class DiaryDetailViewModel: ObservableObject {
    
    @Published var diaryList: Binding<[MoodDiary]>
    @Published var diary: MoodDiary
    
    init(diaryList: Binding<[MoodDiary]>, diary: MoodDiary) {
        self.diaryList = diaryList
        self.diary = diary
    }
}
