//
//  DiaryListView.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/08.
//

import SwiftUI

struct DiaryListView: View {
    
    @StateObject var vm: DiaryListViewModel
    @State var isPresenting: Bool = false
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(vm.keys, id:\.self) {
                            key in
                            Section {
                                let items = vm.dic[key] ?? []
                                let orderedItems = items.sorted(by: { $0.date < $1.date })
                                ForEach(orderedItems) {
                                    item in
                                    NavigationLink {
                                        let vm = DiaryDetailViewModel(diaryList: $vm.list, diary: item)
                                        DiaryDetailView(vm: vm)
                                    } label: {
                                        MoodDiaryCell(diary: item)
                                            .frame(height: 50)
                                    }
                                }
                            } header: {
                                Text(formattedSectionTitle(key))
                                    .font(.system(size: 25, weight: .bold))
                            }
                            .frame(height: 60)
                            .padding()
                        }
                    }
                }
                HStack {
                    Button {
                        isPresenting = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(40)
                }
            }
            .navigationTitle("Emotion Diary")
        }
        .sheet(isPresented: $isPresenting) {
            let vm = DiaryViewModel(isPresented: $isPresenting, diaryList: $vm.list)
            DiaryDateInputView(vm: vm)
        }
        .onAppear {
            vm.fetch()
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
        DiaryListView(vm: DiaryListViewModel(storage: MoodDiaryStorage()))
    }
}
