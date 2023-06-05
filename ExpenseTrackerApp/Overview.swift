//
//  Overview.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 22/05/23.
//

import SwiftUI
import SwiftUICharts

struct Overview: View {
    @EnvironmentObject var transactionsListVM: TransactionListViewModel
    var body: some View {
        NavigationView {
            
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title)
                        .bold()
                    
                    let data = transactionsListVM.accumulateTransactions()
                    
                    if !data.isEmpty{
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView{
                            VStack(alignment: .leading){
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                                               foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                    }
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .cancellationAction){
                    NavigationLink{
                        ProfileView()
                    } label: {
                        Image(systemName: "person")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.primary, .primary)
                    }
                    
                }
                
                ToolbarItem{
                    NavigationLink{
                        NotificationsView()
                    } label: {
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Overview_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            Overview()
            Overview()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
