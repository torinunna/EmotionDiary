//
//  DiaryListView.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/08.
//

import SwiftUI

struct DiaryListView: View {
    
    @State var vm: DiaryListViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        LazyVGrid(columns: layout) {
            ForEach(vm.keys, id:\.self) {
                key in
                Section {
                    let items = vm.dic[key] ?? []
                    let orderedItems = items.sorted(by: { $0.date < $1.date })
                    ForEach(orderedItems) {
                        item in MoodDiaryCell(diary: item)
                            .frame(height: 50)
                    }
                } header: {
                    Text(key)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}
