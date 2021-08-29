//
//  LoginView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var senha: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
            Spacer()
            VStack{
                TextoInput(placeholder: "Digite seu e-mail", imagemLateral: "envelope", corInput: .principal, tipoTeclado: .emailAddress, valorTexto: email)
                
                SenhaInput(placeholder: "Digite sua senha", imagemLateral: "lock", corInput: .principal, valorTexto: senha)
            }
            Spacer()
            HStack {
                Button(action: {}, label: {
                    Text("Entrar")
                        .botaoPrincipal()
                })
                
                NavigationLink(
                    destination: CadastroView(),
                    label: {
                        Text("Cadastre-se")
                            .botaoSecundario()
                    })
            }
            
            Spacer()
            Spacer()
        }
        .navigationTitle("Entrar")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
