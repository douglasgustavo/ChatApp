//
//  ViewExtension.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

extension View {
    func inputPrincipal() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.principal)
            .padding(10)
    }
    
    func inputSecondary() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.secondary)
            .padding(10)
    }
    
    func inputDanger() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.danger)
            .padding(10)
    }
    
    func botaoPrincipal() -> some View {
        self
            .padding(15)
            .background(Color.principal)
            .cornerRadius(15)
            .foregroundColor(.white)
            .font(.title2)
            .shadow(radius: 4)
    }
    
    func botaoSecundario() -> some View {
        self
            .padding(15)
            .cornerRadius(15)
            .foregroundColor(.principal2)
            .font(.title2)
    }
    
    func selecionaInput(tipo: TipoInput) -> some View {
        
        switch tipo {
        case .principal:
            return AnyView(inputPrincipal())
        case .secondary:
            return AnyView(inputSecondary())
        case .danger:
            return AnyView(inputDanger())
        }
    }
}
