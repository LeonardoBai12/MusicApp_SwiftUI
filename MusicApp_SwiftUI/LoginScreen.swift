//
//  LoginScreenView.swift
//  MusicApp_SwiftUI
//
//  Created by Leonardo Bai on 03/09/23.
//

import SwiftUI

struct LoginScreen: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var isToggleOn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Gradient(colors: [.black, .purple]))
                        .ignoresSafeArea()
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                        .ignoresSafeArea()
                        .frame(height: 500)
                    
                    VStack(alignment: .leading) {
                        Text("Crie sua conta")
                            .font(.largeTitle)
                            .padding(.bottom, 15)
                            .bold()
                        
                        DefaultTextField(hint: "E-mail", value: $userName)
                            .padding(.bottom, 10)
                        DefaultTextField(hint: "Senha", value: $password, isPassword: true)
                            .padding(.bottom, 5)
                        
                        Toggle("Lembrar minha senha", isOn: $isToggleOn)
                            .padding(.bottom, 2)
                        
                        NavigationLink(
                            destination: PlaylistScreen(),
                            label: {
                                Text("Criar conta")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                            }
                        ).buttonStyle(.borderedProminent)
                            .tint(.purple)
                            .padding(.bottom, 5)
                        
                        
                        NavigationLink(
                            destination: PlaylistScreen(),
                            label: {
                                HStack {
                                    Image(systemName: "apple.logo")
                                    Text("Continuar com Apple")
                                        .font(.title2)
                                        .padding(.vertical, 8)
                                }.frame(maxWidth: .infinity)
                                
                            }
                        ).buttonStyle(.borderedProminent)
                            .tint(.black)
                        
                        HStack {
                            Text("Já possui uma conta?")
                                .foregroundColor(.gray)
                            Text("Entre")
                                .foregroundColor(.blue)
                        }.padding(.bottom)
                            .frame(maxWidth: .infinity)
                    }.padding(.horizontal, 20)
                }
                
                Image("lbio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 40)
            }
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

struct DefaultTextField: View {
    let hint: String
    let value: Binding<String>
    @State private var hidePassword = false
    var isPassword = false
    @State private var isSecured: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(hint).font(.title3)
                
                if isPassword {
                    Text("Recuperar senha")
                        .foregroundColor(.blue)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .trailing
                        )
                }
                
            }
            
            let textField = TextField("", text: value)
                .padding(15)
                .tint(.purple)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.purple.opacity(0.3), lineWidth: 3)
                }
            
            if isPassword {
                ZStack(alignment: .trailing) {
                    if isSecured {
                        SecureField("", text: value)
                            .padding(15)
                            .tint(.purple)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(
                                        .purple.opacity(0.3),
                                        lineWidth: 3
                                    )
                            }
                    } else {
                        textField
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(
                            systemName: self.isSecured
                            ? "eye.slash"
                            : "eye"
                        ).accentColor(.gray)
                    }.padding(.trailing, 10)
                }
            } else {
                textField
            }
        }
    }
}
