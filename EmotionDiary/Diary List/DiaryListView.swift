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
        ScrollView {
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
                        Text(formattedSectionTitle(key))
                            .font(.system(size: 25))
                    }
                    .frame(height: 60)
                }
            }
        }
    }
}

extension DiaryListView {
    private func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id
            .components(separatedBy: "-")
            .compactMap{ Int($0) }
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MMMM"
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}
