//
//  LoginView.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 01/06/23.
//

import SwiftUI

struct LoginView: View {
    //@ObservedObject var viewModel: LoginViewModel
    @StateObject private var loginViewModel = LoginViewModel()
    
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .frame(width: 400, height: 700).padding(.top, -180)
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                VStack{
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Username")
                            .font(.headline)
                            .foregroundColor(.text)
                        
                        
                        TextField("", text: $loginViewModel.loginModel.username)
                            .frame(width: 350, height: 50)
                            .border(Color.icon.opacity(0.5), width: 2)
                            .cornerRadius(5)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(.text)
                        
                        SecureField("", text: $loginViewModel.loginModel.password)
                            .frame(width: 350, height: 50)
                            .border(Color.icon.opacity(0.5), width: 2)
                            .cornerRadius(5)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Spacer()
                    
                    HStack(alignment: .center){
                        NavigationLink(destination: Overview(), isActive: $loginViewModel.loginModel.isLoginValid) {
                            
                            Text("Iniciar sesión")
                                .bold()
                                .frame(width: 300, height: 50)
                                .background(Color.icon)
                                .foregroundColor(Color.background)
                                .cornerRadius(10)
                                .onTapGesture {
                                    loginViewModel.login()
                                }
                        }
                    }
                    .frame(width: 350)
                    Spacer()
                    Spacer()
                }
                .frame(width: 400, height: 400)
                //.border(width: 5)
                .background(Color.white)
                .cornerRadius(20)
                .padding([.top],200)
                
            }
            .frame(width: 400)
            .alert(isPresented: $loginViewModel.loginModel.showAlert) {
                Alert(title: Text("Usuario o contraseña incorrecto"))
            }
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Image("sky").resizable().cornerRadius(20).ignoresSafeArea())
        
    }
}


struct LoginView_Previews: PreviewProvider {

    static var previews: some View {
        Group{
            NavigationView{ LoginView() }
            //NavigationView{ LoginView().preferredColorScheme(.dark) }
        }


    }
}

