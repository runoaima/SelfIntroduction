//
//  MainTabView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/26.
//

import Foundation
import SwiftUI

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
                    Image(systemName: "list.bullet")
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
