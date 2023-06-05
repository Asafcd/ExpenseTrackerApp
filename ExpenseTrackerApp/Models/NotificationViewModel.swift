//
//  NotificationViewModel.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 03/06/23.
//

import Foundation
import Collections
import Combine

typealias NotificationGroup = OrderedDictionary<String, [Notification]>
typealias NotificationPrefixSum = [(String, Double)]

final class NotificationListViewModel: ObservableObject {
    
    @Published var notificationsArray: [Notification] = []
   // private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.notificationsArray = [
            Notification(name: "Miles Morales", date: "01/24/2022", img: "", content: "Add a shared expense in group"),
           Notification(name: "Peter Parker", date: "01/24/2022", img: "String", content: "Add a shared expense in group"),
           Notification(name: "Darth Vader", date: "01/24/2022", img: "", content: "Add a shared expense in group"),
           Notification(name: "Obi-Wan", date: "01/24/2022", img: "", content: "Add a shared expense in group"),
           Notification(name: "Batman", date: "01/24/2022", img: "", content: "Add a shared expense in group")
        ]
        
        print(self.notificationsArray)
    }
    
    

}
