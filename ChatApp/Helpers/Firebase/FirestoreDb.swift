//
//  FirestoreDb.swift
//  ChatApp
//
//  Created by Douglas Santos on 29/08/21.
//

import FirebaseFirestore

class FirebaseDb {
    var userManager = FirebaseUserManager()
    var consultar = FirestoreQuery()
}

struct FirebaseUserManager {
    var firestore = Firestore.firestore()
    
    func cadastroUsuario(email: String, nome: String, idUsuario: String) {
        firestore.collection("usuarios")
            .document(idUsuario)
            .setData([
                        "nome": nome,
                        "email": email,
                        "dataCadastro": Date()
            ])
        registraLoginLogoutUsuario(idUsuario: idUsuario, acao: .login)
    }
    
    func registraLoginLogoutUsuario(idUsuario: String, acao: LoginLogout) {
        var result = ""
        
        switch acao {
        case .login:
            result = "login"
        case .logout:
            result = "logout"
        }
        
        firestore
            .collection("usuarios")
            .document(idUsuario)
            .collection("logLoginLogout")
            .document(String(describing: Date()))
            .setData([
                "acao": result,
                "dataHora": Date()
            ])
    }
    
    func obterNomeUsuario(idUsuario: String) -> String {
        var nome: String = ""
        firestore
            .collection("usuarios")
            .document(idUsuario)
            .getDocument { document, error in
                if let document = document {
                    nome = document.get("nome") as! String
                }
            }
        return nome
    }
}

class FirestoreQuery {
    var firestore = Firestore.firestore()
    
    private var nome: String = ""
    private var email: String = ""
    
    
    func getNome(idUsuario: String) -> String {
        var resultado: String = ""
        
        let usuarioRef = firestore
            .collection("usuarios")
            .document(idUsuario)
        
        usuarioRef.getDocument { result, error in
            if let dados = result?.data() {
                self.nome = dados["nome"] as! String
            }
        }
        return self.nome
    }
    
    func getEmail(idUsuario: String) -> String{
        var resultado: String = ""
        
        let usuarioRef = firestore
            .collection("usuarios")
            .document(idUsuario)
        
        usuarioRef.getDocument { result, error in
            if let dados = result?.data() {
                self.email = dados["email"] as! String
            }
        }
        return self.email
    }
}

