//
//  DiaryDetailView.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/08.
//

import SwiftUI

struct DiaryDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var diary: MoodDiary
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text(diary.date)
                    .font(.system(size: 30, weight: .bold))
                Image(systemName: diary.mood.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                    .frame(height: 80)
                Text(diary.text)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
        }
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diary: MoodDiary.list.first!)
    }
}
