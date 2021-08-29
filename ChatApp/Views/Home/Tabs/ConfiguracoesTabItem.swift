//
//  ConfiguracoesTabItem.swift
//  ChatApp
//
//  Created by Douglas Santos on 29/08/21.
//

import SwiftUI
import FirebaseFirestore

struct ConfiguracoesTabItem: View {
    @EnvironmentObject var session: SessionStore
    
    var database = FirebaseDb()
    
    @State var nome: String = "Seu nome"
    @State var email: String = "Seu email"
    @State var urlImagem: String = "user"
    
    var body: some View {
            VStack{
                HStack{
                    VStack(spacing: 15){
                        Image(urlImagem)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Button(action: {}, label: {
                            Text("Escolher Imagem")
                                .font(.body)
                                .disabled(true)
                        })
                    }
                    VStack (spacing: 30){
                        Text(nome)
                            .font(.body)
                        
                        Text(email)
                            .font(.body)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Configurações")
            .navigationBarItems(trailing: Button(action: {
                self.database.userManager.registraLoginLogoutUsuario(idUsuario: self.session.retornaUid(), acao: .logout)
                self.session.deslogarUsuario()
            }, label: {
                Text("Sair")
            }))
            .onAppear(perform: {
                if let id = session.session?.uid {
                    let usuarioRef = Firestore.firestore()
                        .collection("usuarios")
                        .document(id)
                    
                    usuarioRef.getDocument { result, error in
                        if let dados = result?.data() {
                            self.nome = dados["nome"] as! String
                            self.email = dados["email"] as! String
                        }
                    }
                }
            })
    }
}

struct ConfiguracoesTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ConfiguracoesTabItem()
    }
}
