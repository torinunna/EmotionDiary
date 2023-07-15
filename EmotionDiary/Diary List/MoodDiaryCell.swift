//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/09.
//

import SwiftUI

struct MoodDiaryCell: View {
    
    var diary: MoodDiary
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack {
            Image(systemName: diary.mood.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 0)
                .frame(height: 50)
            
            Text(formattedDate(dateString: diary.date))
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
    
    private func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: dateString)
        
        formatter.dateFormat = "d일"
        return formatter.string(from: date!)
    }
}

struct MoodDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodDiaryCell(diary: MoodDiary.list.first!)
    }
}
