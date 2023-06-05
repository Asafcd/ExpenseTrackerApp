//
//  ContentView.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 08/05/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {

    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
