//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Erica on 5/19/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import UIKit


struct MessageViewModel {
    private let message: Message
    
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? .lightGray : .systemPurple
    }
    
    
    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? .black : .white
    }
    
    init(message: Message) {
        
        self.message = message
    }
    
}
