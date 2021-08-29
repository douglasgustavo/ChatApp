//
//  CadastroView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct CadastroView: View {
    
    @State var nome: String = ""
    @State var email: String = ""
    @State var senha: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
            Spacer()
            VStack{
                TextoInput(placeholder: "Digite seu nome", imagemLateral: "person", corInput: .principal, valorTexto: nome)
                
                TextoInput(placeholder: "Digite seu e-mail", imagemLateral: "envelope", corInput: .principal, tipoTeclado: .emailAddress, valorTexto: email)
                
                SenhaInput(placeholder: "Digite sua senha", imagemLateral: "lock", corInput: .principal, valorTexto: senha)
            }
            Spacer()
            HStack {
                Button(action: {}, label: {
                    Text("Cadastrar")
                        .botaoPrincipal()
                })
            }
            
            Spacer()
            Spacer()
        }
        .navigationTitle("Cadastro")
    }
}

struct CadastroView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView()
    }
}
