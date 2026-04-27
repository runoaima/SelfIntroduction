//
//  MonthView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/27.
//

import SwiftUI

struct MonthView: View {
    @Binding var currentDate: Date
    var body: some View {
        ZStack {
            Image(monthTitle)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 24)
                
        }
    }
    var monthTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: currentDate)
    }
}

