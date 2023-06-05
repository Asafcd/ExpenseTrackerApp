//
//  NotificationsView.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 17/05/23.
//

import SwiftUI

struct NotificationsView: View {
   //@EnvironmentObject var notificationViewModel: NotificationListViewModel
    
    var body: some View {
        let notificationsArray = [
            Notification(name: "Miles Morales", date: "01/24/2022", img: "", content: "Add a shared expense in group"),
            Notification(name: "Peter Parker", date: "01/24/2022", img: "String", content: "Add a shared expense in Miles Morales group"),
            Notification(name: "Darth Vader", date: "01/24/2022", img: "", content: "Leave the group"),
            Notification(name: "Obi-Wan", date: "01/24/2022", img: "", content: "Added to his group"),
            Notification(name: "Miles Morales", date: "01/24/2022", img: "", content: "Added to his group")
        ]
        VStack(spacing: 2){
            List{
                Section{
                    ForEach(notificationsArray){notification in
                        NotificationRow(notification: notification)
                        
                    }
                } header: { Text("January") }.listSectionSeparator(.hidden)
               
            }
            .listStyle(.plain)
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
        NotificationsView().preferredColorScheme(.dark)
        NotificationRow(notification: notificationPreviewData)
    }
}

struct NotificationRow: View{
    var notification: Notification
    var body: some View {
        HStack(alignment: .center, spacing:20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    Image(systemName: "person")
                        .foregroundColor(Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6){
                Text(notification.name)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.text)
                
                Text(notification.content)
                    .font(.footnote)
                    .opacity(0.7)
                    .foregroundColor(.primary)
                
                Text(notification.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
        }
        .frame(alignment: .leading)
        
    }
}
