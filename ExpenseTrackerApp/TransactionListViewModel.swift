//
//  TransactionListViewModel.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 09/05/23.
//

import Foundation

final class TransactionListViewModel: ObservableObject {
    @Published var transaction: [Transaction] = []
    
    func getTransaction(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: <#T##URLRequest#>)
    }
}
