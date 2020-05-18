//
//  ChatController.swift
//  ChatApp
//
//  Created by Erica on 5/18/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import UIKit

class ChatController: UICollectionViewController {
    
    
  // MARK: - Properties
    
    private let user: User
    
   // MARK: - Lifecycle
    
    init(user: User) {
        
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        
    }
    
}
