//
//  PreviewData.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 09/05/23.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)

var notificationPreviewData =  Notification(name: "Miles Morales", date: Date().formatted(), img: "", content: "Add a shared expense in group")
var notificationListPeviewData = [Notification](repeating: notificationPreviewData, count: 10)
