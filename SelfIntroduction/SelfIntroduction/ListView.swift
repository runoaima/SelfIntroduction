//
//  ListView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/26.
//

import Foundation
import SwiftUI

// リストページを表示
struct ListView: View {
    @Binding var schedules: [ScheduleItem]
    var body: some View {
        List {
            ForEach(schedules) { item in
                VStack(alignment: .leading) {
                    Text("\(item.year)年\(item.month)月\(item.day)日")
                        .font(.headline)
                    Text(item.text)
                        .font(.body)
                }
                .padding(8)
            }
        }
    }
}
