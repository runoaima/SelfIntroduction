//
//  SheetView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/28.
//

import SwiftUI

struct SheetView: View {
    var body: some View {// 予定追加ポップ
        .sheet(isPresented: $showScheduleSheet) {
            VStack(spacing: 20) {
                Text("\(year)年 \(month)月 \(selectedDay)日の予定")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                Text("開始時間")
                Picker("開始時間", selection: $startTime) {
                    ForEach(times, id: \.self) { time in
                        Text(time)
                            
                    }
                }.foregroundStyle(.black)
                Text("終了時間")
                Picker("終了時間", selection: $endTime) {
                    ForEach(times, id: \.self) { time in
                        Text(time)
                            
                    }
                }.foregroundStyle(.black)
                
                
                TextField("予定を入力", text: $scheduleText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    let newSchedule = ScheduleItem(
                        year: year,
                        month: month,
                        day: selectedDay,
                        startTime: startTime,
                        endTime: endTime,
                        text: scheduleText
                    )
                    
                    schedules.append(newSchedule)
                    showScheduleSheet = false
                } label: {
                    Text("保存")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Button("キャンセル") {
                    showScheduleSheet = false
                }.foregroundStyle(.black)
                
                Spacer()
            }
        }.frame(width: geometry.size.width, height: geometry.size.height)

    }
}

#Preview {
    SheetView()
}
