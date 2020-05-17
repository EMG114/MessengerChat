//
//  AuthService.swift
//  ChatApp
//
//  Created by Erica on 5/17/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import Foundation
import Firebase

struct AuthService {
    
  static let shared = AuthService()
    
    func logUserIn(withEmail email : String, password: String, completion: AuthResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
          
        

    }
    
    func createUser() {
        
    }
    
}
