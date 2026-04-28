//
//  CalendarView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/26.
//

import Foundation
import SwiftUI

// Identifiableデータを識別できるように
struct ScheduleItem: Identifiable {
    let id = UUID()
    let year: Int
    let month: Int
    let day: Int
    let startTime: String
    let endTime: String
    let text: String
}

// カレンダーページを表示
struct CalendarView: View {
    @State var year = Calendar.current.component(.year, from: Date())
    @State var month = Calendar.current.component(.month, from: Date())
    @State var day = Calendar.current.component(.day, from: Date())
    
    @State private var showScheduleSheet = false
    @State private var selectedDay = 1
    @State private var scheduleText = ""
    @State private var startTime = "00:00"
    @State private var endTime = "00:30"
    @Binding var schedules: [ScheduleItem]
    
    @State var currentDate = Date()
    
    let months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    let days: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    let calendar = Calendar.current
    var times = generateTimes()
    
    var body: some View {
        GeometryReader { geometry in
            
            let newdate = calendar.date(from: DateComponents(year: year, month: month))!
            let firstDay = calendar.date(from: DateComponents(year: year, month: month, day: 1))!
            
            let newdates = calendar.range(of: .day, in: .month, for: newdate)!.count
            let newday = calendar.component(.weekday, from: firstDay)
            let dates = Array(1...newdates)
            
            let screenWidth = geometry.size.width
            
            
            VStack {
                
                HStack {
                    Button {
                        if month == 1 {
                            year = year - 1
                            month = 12
                        } else {
                            month = month - 1
                        }
                        changeMonth(-1)
                    } label: {
                        Text("<")
                            .padding()
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    Button {
                        if month == 12 {
                            year = year + 1
                            month = 1
                        } else {
                            month = month + 1
                        }
                        changeMonth(1)
                    } label: {
                        Text(">")
                            .padding()
                            .font(.title)
                    }
                }
                MonthView(currentDate: $currentDate)
                Text("Self Introduction")
                Text("\(year)")
                    .padding(.bottom)
                // 曜日表示
                HStack {
                    ForEach(days, id: \.self){ day in
                        Text(day).frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                // 日付表示
                VStack(spacing: 0) {
                    
                    ForEach(0...5, id: \.self) { i in
                        HStack(spacing: 0) {
                            ForEach(1...7, id: \.self) { j in
                                let index = i * 7 + j - newday
                                
                                if index >= 0 && index < dates.count {
                                    Button {
                                        selectedDay = dates[index]
                                        scheduleText = ""
                                        showScheduleSheet = true
                                    } label: {
                                        Text("\(dates[index])")
                                            .frame(width: screenWidth/7, height: screenWidth/7)
                                            .foregroundStyle(.black)
                                            .background(Color.accentColor)
                                            .clipShape(Circle())
                                        
                                    }
                                } else {
                                    Text("")
                                        .frame(width: screenWidth/7, height: screenWidth/7)
                                }
                            }
                        }
                    }
                }
            }
            
            // 予定追加ポップ
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
    
    func changeMonth(_ value: Int) {
        if let newDate = calendar.date(byAdding: .month, value: value, to: currentDate) {
            currentDate = newDate
        }
    }
}

func generateTimes() -> [String] {
    var times: [String] = []
    
    for hour in 0..<24 {
        times.append(String(format: "%02d:00", hour))
        times.append(String(format: "%02d:30", hour))
    }
    return times
}
