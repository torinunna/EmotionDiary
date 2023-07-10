//
//  EmotionDiaryApp.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/08.
//

import SwiftUI

@main
struct EmotionDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = DiaryListViewModel()
            DiaryListView(vm: vm)
        }
    }
}
