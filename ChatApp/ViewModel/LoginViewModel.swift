//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Erica on 5/15/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import Foundation

struct LoginViewModel: AuthenticationProtocol {
  
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false 
    }
    
}
