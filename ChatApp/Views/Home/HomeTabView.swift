//
//  HomeTabView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var session: SessionStore
    var database = FirebaseDb()
    
    func sair(){
        session.deslogarUsuario()
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ContatosTabItem()
            }
            .tabItem {
                Image(systemName: "person.3")
                Text("Contatos")
            }
            
            NavigationView{
                MensagensTabItem()
            }
            .tabItem {
                Image(systemName: "message")
                Text("Mensagens")
            }
            
            NavigationView{
                ConfiguracoesTabItem()
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Configurações")
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView().environmentObject(SessionStore())
    }
}
