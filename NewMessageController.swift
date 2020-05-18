//
//  NewMessageController.swift
//  ChatApp
//
//  Created by Erica on 5/17/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import UIKit

class NewMessageController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemPink
    }
}
