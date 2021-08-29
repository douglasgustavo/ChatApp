//
//  TextInput.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct TextoInput: View {
    
    var placeholder: String = "Digite seu texto"
    var imagemLateral: String = "text.bubble"
    var corInput: Color = .principal
    var tipoTeclado: UIKeyboardType = .default
    
    @Binding var valorTexto: String
    
    var body: some View {
        HStack(spacing: 13){
            Image(systemName: imagemLateral)
                .foregroundColor(corInput)
            
            TextField(placeholder, text: $valorTexto)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(corInput)
                .padding(10)
                .keyboardType(tipoTeclado)
        }
        .padding(.horizontal)
        .padding(.vertical, 0)
    }
}
