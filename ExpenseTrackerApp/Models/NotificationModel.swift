//
//  NotificationModel.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 03/06/23.
//

import Foundation
import SwiftUIFontIcon

struct Notification: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var date: String
    var img: String
    var content: String
    
    var dateParsed: Date {
        date.dateParsed()
    }
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}
