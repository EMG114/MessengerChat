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
    
    
    static func fetchUsers(completion: @escaping([User])->Void) {
        var users = [User]()
    Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
        snapshot?.documents.forEach({ (document) in
            let dictionary = document.data() 
            let user = User(dictionary: dictionary)
            users.append(user)
            completion(users)
        })
    }
        
    }
    
    static func fetchMessages(forUser user: User, completion: @escaping ([Message])->Void) {
        var messages = [Message]()
        
        guard let currentId = Auth.auth().currentUser?.uid else { return }
  
        let query = COLLECTION_MESSAGES.document(currentId).collection(user.uid).order(by: "timestamp")
        query.addSnapshotListener { (snapshot , error) in
            snapshot?.documentChanges.forEach({ (change) in
                if change.type == .added {
                    let dictionary = change.document.data()
                    messages.append(Message(dictionary: dictionary))
                    completion(messages)
                }
            })
        }
    
    }
 
    
    static func uploadMessage(_ message: String, to user: User, completion: ((Error?) -> Void)?) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
   
        let data = ["text": message, "toId":user.uid, "timestamp": Timestamp(date: Date())] as [String: Any]
        
        COLLECTION_MESSAGES.document(currentUid).collection(user.uid).addDocument(data: data) { ( _) in
            COLLECTION_MESSAGES.document(user.uid).collection(currentUid).addDocument(data: data, completion: completion )
    
     }
    }
    
}
