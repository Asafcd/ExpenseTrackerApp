//
//  LoginViewModel.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 01/06/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var loginModel = LoginModel(
        name: UserDefaults.standard.string(forKey: "name") ?? "Root",
        username: "",
        password: "",
        showAlert: false,
        isLoginValid: false
    )
    var defaults = UserDefaults.standard
    
    func login() {
        if loginModel.username == (defaults.string(forKey: "username") ?? "Root") && loginModel.password == defaults.string(forKey: "password") ?? "toor" {
            loginModel.isLoginValid = true

        }
        else { loginModel.showAlert = true }
    }
}

