//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2022/10/14.
//

import Foundation
import Combine

final class DiaryListViewModel: ObservableObject {
    
    let storage: MoodDiaryStorage
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
       
    }
    
    var keys: [String] {
//        given: "2022-5", "2022-4", "2022-6"
//        sorted: "2022-6", "2022-5", "2022-4"
        return dic.keys.sorted { $0 < $1 }
    }
    
    private func bind() {
        $list.sink { items in
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier })
            self.persist(items: items)
        }.store(in: &subscriptions)
    }
    
    func persist(items: [MoodDiary]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
