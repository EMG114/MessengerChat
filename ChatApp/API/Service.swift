//
//  Service.swift
//  ChatApp
//
//  Created by Erica on 5/17/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import Foundation
import Firebase


struct Service {
    
    
static func fetchUsers() {
    Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
        snapshot?.documents.forEach({ (document) in
            <#code#>
        })
    }
        
    }
 
    
    
    
    
}
