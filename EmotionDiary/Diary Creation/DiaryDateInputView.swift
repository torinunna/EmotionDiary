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
        VStack {
            DatePicker("Date", selection: $vm.date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
        }
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false))
        DiaryDateInputView(vm: vm)
    }
}
