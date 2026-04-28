//
//  NotificationView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/28.
//

import SwiftUI

struct NotificationView: View {
    @Binding var schedules: [ScheduleItem]
    @Binding var year: Int
    @Binding var month: Int
    @Binding var day: Int
    var body: some View {
        List {
            ForEach(schedules) { item in
                VStack(alignment: .leading) {
                    if(item.year == year && item.month == month && item.day == day){
                        Text("\(item.year)年\(item.month)月\(item.day)日")
                            .font(.headline)
                        Text(item.text)
                            .font(.body)
                    }
                }
                .padding(8)
            }
        }
    }
}
