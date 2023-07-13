//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2023/07/08.
//

import SwiftUI

struct DiaryDateInputView: View {
 
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Date", selection: $vm.date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                
                Spacer()
                
                NavigationLink {
                    DiaryMoodInputView(vm: vm)
                } label: {
                    Text("NEXT")
                        .frame(width: 150, height: 60)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(40)
                }
                
                Spacer()
            }
        }
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false), diaryList: .constant(MoodDiary.list))
        DiaryDateInputView(vm: vm)
    }
}
