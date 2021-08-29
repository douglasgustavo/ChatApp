//
//  LoginView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionStore
    var database = FirebaseDb()
    
    @State var email: String = ""
    @State var senha: String = ""
    @State var error: String = ""
    @State var alerta: Bool = false
    
    func login(){
        session.logarUsuario(email: email, senha: senha) { result, error in
            if let error = error {
                self.error = error.localizedDescription
                self.alerta = true
            } else {
                if let idUsuario = result?.user.uid {
                    self.database.userManager.registraLoginLogoutUsuario(idUsuario: idUsuario, acao: .login)
                }
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
                TextoInput(placeholder: "Digite seu e-mail", imagemLateral: "envelope", corInput: .principal, tipoTeclado: .emailAddress, valorTexto: $email)
                
                SenhaInput(placeholder: "Digite sua senha", imagemLateral: "lock", corInput: .principal, valorTexto: $senha)
            }
            Spacer()
            HStack {
                Button(action: login, label: {
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
            .alert(isPresented: $alerta, content: {
                Alert(title: Text("Atenção"), message: Text(error), dismissButton: .default(Text("Ok")))
            })
            
            Spacer()
            Spacer()
        }
        .navigationTitle("Entrar")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(SessionStore())
    }
}
