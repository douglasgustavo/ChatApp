//
//  CadastroView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI
import FirebaseFirestore

struct CadastroView: View {
    @EnvironmentObject var session: SessionStore
    var database = FirebaseDb()
    
    @State var nome: String = ""
    @State var email: String = ""
    @State var senha: String = ""
    @State var error: String = ""
    @State var alerta: Bool = false
    
    func cadastrar(){
        session.criarUsuario(email: email, senha: senha) { result, error in
            if let error = error {
                self.error = error.localizedDescription
                self.alerta = true
            } else {
                if let idUsuario = result?.user.uid {
                    self.database.userManager.registraLoginLogoutUsuario(idUsuario: idUsuario, acao: .login)
                }
                self.nome = ""
                self.email = ""
                self.senha = ""
            }
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
            Spacer()
            VStack{
                TextoInput(placeholder: "Digite seu nome", imagemLateral: "person", corInput: .principal, valorTexto: $nome)
                
                TextoInput(placeholder: "Digite seu e-mail", imagemLateral: "envelope", corInput: .principal, tipoTeclado: .emailAddress, valorTexto: self.$email)
                
                SenhaInput(placeholder: "Digite sua senha", imagemLateral: "lock", corInput: .principal, valorTexto: $senha)
            }
            Spacer()
            HStack {
                Button(action: cadastrar, label: {
                    Text("Cadastrar")
                        .botaoPrincipal()
                })
            }
            .alert(isPresented: $alerta, content: {
                Alert(title: Text("Atenção"), message: Text(error), dismissButton: .default(Text("Ok")))
            })
            
            Spacer()
            Spacer()
        }
        .navigationTitle("Cadastro")
    }
}

struct CadastroView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView().environmentObject(SessionStore())
    }
}
