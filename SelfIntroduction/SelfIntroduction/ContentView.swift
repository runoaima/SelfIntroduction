//
//  ContentView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var schedules: [ScheduleItem] = []
    
    var body: some View{
        TabView {
            // カレンダーページ
            SelfIntroductionView()
                .tabItem {
                    Image(systemName: "person")
                    Text("自己紹介")
                }
            // カレンダーページ
            CalendarView(schedules: $schedules)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("カレンダー")
                }
            // リストページ
            ListView(schedules: $schedules)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("リスト")
                }
            // 通知ページ
//            NotificationView(
//                            schedules: $schedules,
//                            year: $year,
//                            month: $month,
//                            day: $day
//                        )
//                .tabItem {
//                    Image(systemName: "bell")
//                    Text("通知")
//                }
        }
    }
}

#Preview {
    ContentView()
}
