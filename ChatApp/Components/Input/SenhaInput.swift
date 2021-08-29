//
//  SenhaInput.swift
//  ChatApp
//
//  Created by Douglas Santos on 28/08/21.
//

import SwiftUI

struct SenhaInput: View {
    var placeholder: String = "Digite sua senha"
    var imagemLateral: String = "text.bubble"
    var corInput: Color = .principal
    
    @Binding var valorTexto: String
    
    var body: some View {
        HStack (spacing: 13){
            Image(systemName: imagemLateral)
                .foregroundColor(corInput)
            
            SecureField(placeholder, text: $valorTexto)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(corInput)
                .padding(10)
        }
        .padding(.horizontal)
        .padding(.vertical, 0)
        
    }
}
