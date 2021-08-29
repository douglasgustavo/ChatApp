//
//  HomeTabView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var session: SessionStore
    
    func sair(){
        session.deslogarUsuario()
    }
    
    var body: some View {
        HStack{
            Text("Logado!")
            Button(action: sair, label: {
                Text("Sair")
            })
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView().environmentObject(SessionStore())
    }
}
