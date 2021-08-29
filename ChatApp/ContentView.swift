//
//  ContentView.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser(){
        session.lister()
    }
    
    var body: some View {
        Group{
            if session.session != nil {
                HomeTabView()
            } else {
                NavigationView{
                    LoginView()
                }
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
