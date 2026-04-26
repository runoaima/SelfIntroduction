//
//  ContentView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        MainTabView()
    }
}

// カレンダーページを表示
struct CalendarView: View {
    @State var year = Calendar.current.component(.year, from: Date())
    @State var month = Calendar.current.component(.month, from: Date())
    
    @State private var showScheduleSheet = false
    @State private var selectedDay = 1
    @State private var scheduleText = ""
    
    let months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    let days: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var body: some View {
        
        let calendar = Calendar.current
        
        let newdate = calendar.date(from: DateComponents(year: year, month: month))!
        let firstDay = calendar.date(from: DateComponents(year: year, month: month, day: 1))!
        let newdates = calendar.range(of: .day, in: .month, for: newdate)!.count
        let newday = calendar.component(.weekday, from: firstDay)
        let dates = Array(1...newdates)
        
        
        VStack {
            
            HStack {
                Button {
                    if month == 1 {
                        year = year - 1
                        month = 12
                    } else {
                        month = month - 1
                    }
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
                } label: {
                    Text(">")
                        .padding()
                        .font(.title)
                }
            }
            Text("\(months[month - 1])").font(.largeTitle)
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
            VStack {
                
                ForEach(0...5, id: \.self) { i in
                    HStack {
                        ForEach(1...7, id: \.self) { j in
                            let index = i * 7 + j - newday
                            
                            if index >= 0 && index < dates.count {
                                Button {
                                    selectedDay = dates[index]
                                    scheduleText = ""
                                    showScheduleSheet = true
                                } label: {
                                    Text("\(dates[index])")
                                        .frame(width: 40, height: 40)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(8)
                                        .frame(maxWidth: .infinity)
                                }
                            } else {
                                Text("")
                                    .frame(width: 40, height: 40)
                                    .frame(maxWidth: .infinity)
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
                
                TextField("予定を入力", text: $scheduleText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
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
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

// リストページを表示
struct ListView: View {
    var body: some View {
        Text("")
    }
}

// 画面下のタブバーを表示
struct MainTabView: View {
    var body: some View {
        TabView {
            // カレンダーページ
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("カレンダー")
                }
            // リストページ
            ListView()
                .tabItem {
                    Image(systemName: "")
                    Text("リスト")
                }
            // 通知ページ
            Text("")
                .tabItem {
                    Image(systemName: "bell")
                    Text("通知")
                }
            // 設定ページ
            Text("")
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }
        }
    }
}

#Preview {
    ContentView()
}
