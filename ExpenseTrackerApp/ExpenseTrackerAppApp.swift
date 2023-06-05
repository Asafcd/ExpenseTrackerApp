//
//  ExpenseTrackerAppApp.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 08/05/23.
//

import SwiftUI

@main
struct ExpenseTrackerAppApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
